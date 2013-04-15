require "spec_helper"

describe "Front_Matter" do
    before :all do
      Dir.chdir("test/")
    end


  context "Extraction" do
    before :all do
      @fm =  FrontMatter.new
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
        "      FileName : extract_sh"                                ,
        "          Desc : extract shell functions from shell script" ,
        "        Author : Zhao Cai <caizhaoff@gmail.com>"
      ]
      content = @fm.extract_lines(code.split("\n").map(&:chomp))

      content[:valid][0].should == valid_content

    end

    it "should extract header front matter" do
      code = %Q{
      # --------------- ------------------------------------------------------------
      #       FileName : extract_sh
      #           Desc : extract shell functions from shell script
      #         Author : Zhao Cai <caizhaoff@gmail.com>
      # --------------- ------------------------------------------------------------
      }.unindent

      valid_content = [
        "      FileName : extract_sh"                                ,
        "          Desc : extract shell functions from shell script" ,
        "        Author : Zhao Cai <caizhaoff@gmail.com>"
      ]
      content = @fm.extract_lines(code.split("\n").map(&:chomp))

      content[:valid][0].should == valid_content

    end

    it "should properly extract yaml front matter when there is no ending" do
      code = %Q{
      # ---
      #       FileName : extract_sh
      #           Desc : extract shell functions from shell script
      #         Author : Zhao Cai <caizhaoff@gmail.com>

      abc
      }.unindent

      valid_content = [
        "      FileName : extract_sh"                                ,
        "          Desc : extract shell functions from shell script" ,
        "        Author : Zhao Cai <caizhaoff@gmail.com>",
      ]
      content = @fm.extract_lines(code.split("\n").map(&:chomp))

      content[:unbound][0].should == valid_content
    end
  end



  context "Unindent" do
    before :all do
      @fm =  FrontMatter.new(:unindent => true)
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
        "FileName : extract_sh"                                ,
        "    Desc : extract shell functions from shell script" ,
        "  Author : Zhao Cai <caizhaoff@gmail.com>"
      ]
      content = @fm.extract_lines(code.split("\n").map(&:chomp))

      content[:valid][0].should == valid_content

    end

    it "should extract header front matter" do
      code = %Q{
      # --------------- ------------------------------------------------------------
      #       FileName : extract_sh
      #           Desc : extract shell functions from shell script
      #         Author : Zhao Cai <caizhaoff@gmail.com>
      # --------------- ------------------------------------------------------------
      }.unindent

      valid_content = [
        "FileName : extract_sh"                                ,
        "    Desc : extract shell functions from shell script" ,
        "  Author : Zhao Cai <caizhaoff@gmail.com>"
      ]
      content = @fm.extract_lines(code.split("\n").map(&:chomp))

      content[:valid][0].should == valid_content

    end

    it "should properly extract yaml front matter when there is no ending" do
      code = %Q{
      # ---
      #       FileName : extract_sh
      #           Desc : extract shell functions from shell script
      #         Author : Zhao Cai <caizhaoff@gmail.com>

      abc
      }.unindent

      valid_content = [
        "FileName : extract_sh"                                ,
        "    Desc : extract shell functions from shell script" ,
        "  Author : Zhao Cai <caizhaoff@gmail.com>",
      ]
      content = @fm.extract_lines(code.split("\n").map(&:chomp))

      content[:unbound][0].should == valid_content
    end
  end

  context "YAML" do

  end
end



