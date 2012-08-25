require "test/unit"
require "extr_comment"
require 'awesome_print'
# require 'pry'


class TestExtrComment < Test::Unit::TestCase

  def test_extract_header_style
    code= <<"__RUBY__"
      # --------------- ------------------------------------------------------------
      #       FileName : extract_sh
      #           Desc : extract shell functions from shell script
      #         Author : Zhao Cai <caizhaoff@gmail.com>
      # --------------- ------------------------------------------------------------
__RUBY__

    valid_content = [
      "FileName : extract_sh",
      "Desc : extract shell functions from shell script",
      "Author : Zhao Cai <caizhaoff@gmail.com>"
    ]
    ec = ExtrComment.new()
    content = ec.extract_lines(code.split("\n").map(&:chomp))

    assert_nil(content[:default])
    assert_not_nil(content[:header])
    assert_equal(content[:header][0][:valid], valid_content)

  end

  def test_extract_default_style
    code= <<"__RUBY__"
      # ---
      #       FileName : extract_sh
      #           Desc : extract shell functions from shell script
      #         Author : Zhao Cai <caizhaoff@gmail.com>
      # ...
__RUBY__

    valid_content = [
      "FileName : extract_sh",
      "Desc : extract shell functions from shell script",
      "Author : Zhao Cai <caizhaoff@gmail.com>"
    ]
    ec = ExtrComment.new()
    content = ec.extract_lines(code.split("\n").map(&:chomp))

    assert_not_nil(content[:default])
    assert_nil(content[:header])
    assert_equal(content[:default][0][:valid], valid_content)
  end

  def test_no_ending
    code= <<"__RUBY__"
      # ---
      #       FileName : extract_sh
      #           Desc : extract shell functions from shell script
      #         Author : Zhao Cai <caizhaoff@gmail.com>

abc
__RUBY__

    valid_content = [
      "FileName : extract_sh",
      "Desc : extract shell functions from shell script",
      "Author : Zhao Cai <caizhaoff@gmail.com>"
    ]
    ec = ExtrComment.new()
    content = ec.extract_lines(code.split("\n").map(&:chomp))

    assert_not_nil(content[:default])
    assert_nil(content[:header])
    assert_equal(content[:default][0][:unbound], valid_content)

  end

end
