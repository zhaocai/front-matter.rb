require "spec_helper"

describe "Front_Matter" do

  before :all do
    @fm =  FrontMatter.new
    Dir.chdir("test/")
  end

  it "should extract yaml front matter" do
    code = %Q{
      # ---
      #       FileName : extract_sh
      #           Desc : extract shell functions from shell script
      #         Author : Zhao Cai <caizhaoff@gmail.com>
      # ---
      # 
    }.unindent

    valid_content = [
      "FileName : extract_sh",
      "Desc : extract shell functions from shell script",
      "Author : Zhao Cai <caizhaoff@gmail.com>"
    ]
    content = @fm.extract_lines(code.split("\n").map(&:chomp))

    content[:header].should_be_nil
    content[:yaml][0][:valid].should == valid_content

  end

end



