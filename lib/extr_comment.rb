#!/usr/bin/env ruby
# --------------- ------------------------------------------------------------
#       FileName : extr_comment
#           Desc : extract comment from source code
#         Author : Zhao Cai <caizhaoff@gmail.com>
#       HomePage : [TODO]( HomePage )
#        Version : 0.1
#   Date Created : Sat 25 Aug 2012 01:36:13 AM EDT
#  Last Modified : Sat 25 Aug 2012 05:02:21 PM EDT
#            Tag : [ ruby, comment, extract ]
#      Copyright : © 2012 by Zhao Cai,
#                  Released under current GPL license.
# --------------- ------------------------------------------------------------

# [TODO]( align ) @zhaocai @start(2012-08-25 05:54)
class ExtrComment
  VERSION = '1.0.0'
  attr_accessor :patterns
  def initialize(patterns={} )
    cmarker   = %r{(?<comment> ^\s* \W{1,2} \s*)}x
    @patterns = {
      :header => {
        :filetype => %r{.*},
        :cmarker  => cmarker,
        :start    => %r{#{cmarker} (?<start> -{3,} \s -{3,}$) }x ,
        :content  => %r{#{cmarker} (?<content> .* $)          }x ,
        :end      => %r{#{cmarker} (?<end> -{3,} \s -{3,}$)   }x ,
      },
      :default => {
        :filetype => %r{.*},
        :cmarker  => cmarker,
        :start    => %r{#{cmarker} (?<start> \s*  -{3} $) }x ,
        :content  => %r{#{cmarker} (?<content> .* $)      }x ,
        :end      => %r{#{cmarker} (?<end> \s*  \.{3} $)  }x ,
      },
    } if patterns.empty?

  end

  def extract_lines(lines, filetype=[])
    content={}
    unless filetype.empty?
      patterns = @patterns.select { |k,v|
        filetype.any { |ft| v[:filetype].match(ft)}
      }
    else
      patterns = @patterns
    end

    patterns.each { |k, v|
      content[k] = []
      in_comment = false
      in_content = {
        :valid   => [],
        :invalid => [],
        :unbound => [],
      }

      lines.each { |line|
        if ! in_comment
          case line
          when v[:start]
            in_comment = true
            next
          end
        else
          if v[:end] =~ line
            in_comment = false
            content[k].push(in_content)
            next
          end

          m = v[:content].match(line)
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
        content[k].push(in_content)
      end
    }

    return content.delete_if {|k, v| v.empty?}
  end

  def extract_file(infile, filetype=[])
    return self.extract_lines(File.readlines(infile).map(&:chomp), filetype)
  end

end



