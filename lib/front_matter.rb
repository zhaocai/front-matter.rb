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
require 'facets/string'
require 'front_matter/core/array'

## 
# Extracts embeded info (yaml front matters, for example ) in source
# code comments with predefined format.

class FrontMatter
  VERSION = '1.2.1'

  ##
  # *Optional*: setting for FrontMatter
  #
  # - :patterns => add new patterns to extract 
  # - :unindent => unindent leading whitespace  
  # - :as_yaml  => results are formated for YAML.load
  #
  attr_accessor :setting

  def initialize( opts={} )
    comment_marker   = %r{(?<comment> ^\s* \W{1,2} )}x
    @setting = {
      :patterns => {
        :header => {
          :filetype => %r{.*},
          :pattern  => %r{
            (?<start> #{comment_marker} \s* [-=#*]{3,} .* )[\r\n]
            (?<content> (?: \k<comment> .* [\r\n])+)
            \k<start>
            }x
        },
        :yaml => {
          :filetype => %r{.*},
          :pattern  => %r{
            (?<start> #{comment_marker} \s* -{3} )[\r\n]
            (?<content> (?: \k<comment> .* [\r\n])+)
            (?<empty>^ \s* $)
            }x
        },
      },
      :unindent   => false ,
      :as_yaml    => false ,
    }
    @setting.merge!(opts)
  end

  ##
  # Extract from string
  # - contents : String
  # - filetype : limit patterns to Array of filetypes, default []
  # 
  # *Returns*
  # - Array of extracted front matter, comment string are removed
  #
  # *Raises*
  # - None from this class
  #
  def extract(contents, filetype=[])
    unless filetype.empty?
      patterns = @setting[:patterns].select { |kind, pattern|
        filetype.any { |ft| pattern[:filetype].match(ft)}
      }
    else
      patterns = @setting[:patterns]
    end

    union_patterns = Regexp.union(patterns.collect{ |k, p| p[:pattern] })
    results = [] 
    contents.mscan(union_patterns).each { |m| 
      results << m[:content].gsub(/^#{Regexp.escape(m[:comment])}/, "") 
    }
    
    results.map! { |r| r.unindent } if @setting[:unindent]
    results.map! { |r| "---\n#{r}" } if @setting[:as_yaml]

    return results
  end


  ##
  # Extract from file
  #
  # - path : file path
  # - opts : 
  #   - :filetype  : Array of filetypes
  #   - :firstline
  #   - :lastline
  # 
  # *Returns*
  # - Array of extracted front matter, comment string are removed
  #
  # *Raises*
  # - None from this class
  #
  # *Example*
  #   fm = FrontMatter.new(:unindent => true, :as_yaml => true)
  #   puts fm.extract_file(__FILE__, :firstline => 1, :lastline => 15)
  #
  # The output would be:
  #   ---
  #   Desc          : extract (YAML) front matter from source code
  #   Author        : Zhao Cai <caizhaoff@gmail.com>
  #   HomePage      : https://github.com/zhaocai/front_matter.rb
  #   Date Created  : Sat 25 Aug 2012 01:36:13 AM EDT
  #   Last Modified : Sun 14 Apr 2013 08:05:00 PM EDT
  #   Tag           : [ ruby, YAML, comment, extract ]
  #   Copyright     : (c) 2012 by Zhao Cai,
  #                     Released under current GPL license.

  def extract_file(path, opts={})

    filetype = opts[:filetype] ? opts[:filetype] : []
    if opts[:firstline] || opts[:lastline]
      firstline = opts[:firstline] ? opts[:firstline] - 1 : 0
      lastline = opts[:lastline] ? opts[:lastline] -1 : -1
      return extract(File.readlines(path)[firstline..lastline].join, filetype)
    else
      return extract(File.read(path), filetype)
    end

  end

end


if __FILE__ == $0
  fm = FrontMatter.new(:unindent => true, :as_yaml => true)
  puts fm.extract_file(__FILE__, :firstline => 1, :lastline => 15)
end
