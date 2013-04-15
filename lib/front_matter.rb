#!/usr/bin/env ruby
# =============== ============================================================
#  Desc          : extract (YAML) front matter from source code
#  Author        : Zhao Cai <caizhaoff@gmail.com>
#  HomePage      : https://github.com/zhaocai/front_matter.rb
#  Date Created  : Sat 25 Aug 2012 01:36:13 AM EDT
#  Last Modified : Sun 14 Apr 2013 08:05:00 PM EDT
#  Tag           : [ ruby, YAML, comment, extract ]
#  Copyright     : (c) 2012 by Zhao Cai,
#                  Released under current GPL license.
# =============== ============================================================

require 'facets/hash'
require 'front_matter/core/array'

class FrontMatter
  VERSION = '1.1.0'
  attr_accessor :options
  def initialize( opts={} )
    comment_marker   = %r{(?<comment> ^\s* \W{1,2} )}x
    @options = {
      :patterns => {
        :header => {
          :comment_marker  => comment_marker,
          :filetype => %r{.*},
          :start    => %r{#{comment_marker} (?<start> \s* [-=]{3,} .* [-=]{3,}$) }x ,
          :content  => %r{#{comment_marker} (?<content> .* $)                }x ,
          :end      => %r{#{comment_marker} (?<end> \s* [-=]{3,} .* [-=]{3,}$)   }x ,
        },
        :yaml => {
          :comment_marker  => comment_marker,
          :filetype => %r{.*},
          :start    => %r{#{comment_marker} (?<start> \s*  -{3} $) }x ,
          :content  => %r{#{comment_marker} (?<content> .* $)      }x ,
          :end      => %r{#{comment_marker} (?<end> \s*    -{3} $)  }x ,
        },
      },
      :unindent   => false ,
      :as_yaml    => false ,
    }
    @options.merge!(opts)
  end

  def extract_lines(lines, filetype=[])
    content={}
    unless filetype.empty?
      patterns = @options[:patterns].select { |kind, pattern|
        filetype.any { |ft| pattern[:filetype].match(ft)}
      }
    else
      patterns = @options[:patterns]
    end

    patterns.each { |kind, pattern|
      content[kind] = []
      in_comment = false
      in_content = {
        :valid   => [],
        :invalid => [],
        :unbound => [],
      }

      lines.each { |line|
        if ! in_comment
          case line
          when pattern[:start]
            in_comment = true
            next
          end
        else
          if pattern[:end] =~ line
            in_comment = false
            content[kind].push(in_content)
            next
          end

          m = pattern[:content].match(line)
          begin
            in_content[:valid].push(m[:content])
          rescue IndexError,NoMethodError
            in_content[:invalid].push(line)
          end
        end
      }

      # fail to match ending
      if in_comment
        in_content[:unbound] = in_content[:valid]
        in_content[:valid] = []
        content[kind].push(in_content)
      end
    }

    results = {
      :valid   => [],
      :invalid => [],
      :unbound => [],
    }

    content.each_pair { |kind, v|
      v.each { |c| c.each_pair { |status, content|
        results[status].push(content) unless content.empty? }
      }
    }
    results.delete_if {|status, result| result.empty?}

    if @options[:unindent]
      results.traverse! { |k,v|
        [k, v.map {|i| i.unindent }]
      }
    end

    if @options[:as_yaml]
      results.traverse! { |k,v|
        [k, v.map {|i| "---\n#{i.join("\n")}"}]
      }
    end
    results
  end

  def extract_file(path, opts={})
    filetype = opts[:filetype] ? opts[:filetype] : []
    firstline = opts[:firstline] ? opts[:firstline] : 0
    lastline = opts[:lastline] ? opts[:lastline] : -1

    return extract_lines(File.readlines(path)[firstline..lastline].map(&:chomp), filetype)
  end

end



