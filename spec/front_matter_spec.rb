require "spec_helper"
require "yaml"
describe "Front_Matter" do
  before :all do

    test_dir = "test"
    Dir.mkdir(test_dir) unless Dir.exists?(test_dir)
    Dir.chdir(test_dir)
  end

  context "Extraction" do
    before :all do
      @fm =  FrontMatter.new
    end

    it "should extract yaml front matter" do
      code = %Q{
      # ---
      #       FileName : extract_sh
      #       Desc     : extract shell functions from shell script
      #       Author   : Zhao Cai <caizhaoff@gmail.com>
      # ---
      # 
      }.unindent

      valid_content = [
        "      FileName : extract_sh"                                ,
        "      Desc     : extract shell functions from shell script" ,
        "      Author   : Zhao Cai <caizhaoff@gmail.com>",
        ""
      ]
      front_matters = @fm.extract(code)

      front_matters[0].should == valid_content.join("\n")
    end

    it "should extract header front matter" do
      code = %Q{
      # --------------- ------------------------------------------------------------
      #       FileName : extract_sh
      #       Desc     : extract shell functions from shell script
      #       Author   : Zhao Cai <caizhaoff@gmail.com>
      # --------------- ------------------------------------------------------------
      }.unindent

      valid_content = [
        "      FileName : extract_sh"                                ,
        "      Desc     : extract shell functions from shell script" ,
        "      Author   : Zhao Cai <caizhaoff@gmail.com>",
        ""
      ]
      front_matters = @fm.extract(code)

      front_matters[0].should == valid_content.join("\n")

    end

    it "should properly extract yaml front matter when there is no ending" do
      code = %Q{
      # ---
      #       FileName : extract_sh
      #       Desc     : extract shell functions from shell script
      #       Author   : Zhao Cai <caizhaoff@gmail.com>

      abc
      }.unindent

      valid_content = [
        "      FileName : extract_sh"                                ,
        "      Desc     : extract shell functions from shell script" ,
        "      Author   : Zhao Cai <caizhaoff@gmail.com>",
        ""
      ]
      front_matters = @fm.extract(code)

      front_matters[0].should == valid_content.join("\n")
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
      #       Desc     : extract shell functions from shell script
      #       Author   : Zhao Cai <caizhaoff@gmail.com>
      # ---
      # 
      }.unindent

      valid_content = [
        "FileName : extract_sh"                                ,
        "Desc     : extract shell functions from shell script" ,
        "Author   : Zhao Cai <caizhaoff@gmail.com>",
        ""
      ]
      front_matters = @fm.extract(code)

      front_matters[0].should == valid_content.join("\n")

    end

    it "should extract header front matter" do
      code = %Q{
      # --------------- ------------------------------------------------------------
      #       FileName : extract_sh
      #       Desc     : extract shell functions from shell script
      #       Author   : Zhao Cai <caizhaoff@gmail.com>
      # --------------- ------------------------------------------------------------
      }.unindent

      valid_content = [
        "FileName : extract_sh"                                ,
        "Desc     : extract shell functions from shell script" ,
        "Author   : Zhao Cai <caizhaoff@gmail.com>",
        ""
      ]
      front_matters = @fm.extract(code)

      front_matters[0].should == valid_content.join("\n")

    end

    it "should properly extract yaml front matter when there is no ending" do
      code = %Q{
      # ---
      #       FileName : extract_sh
      #       Desc     : extract shell functions from shell script
      #       Author   : Zhao Cai <caizhaoff@gmail.com>

      abc
      }.unindent

      valid_content = [
        "FileName : extract_sh"                                ,
        "Desc     : extract shell functions from shell script" ,
        "Author   : Zhao Cai <caizhaoff@gmail.com>",
        ""
      ]
      front_matters = @fm.extract(code)

      front_matters[0].should == valid_content.join("\n")
    end
  end

  context "YAML" do
    before :all do
      @fm =  FrontMatter.new(:unindent => true, :as_yaml => true)
    end

    it "should extract and convert to valid yaml" do
      code = %Q{
      # ---
      #       FileName : extract_sh
      #       Desc     : extract shell functions from shell script
      #       Author   : Zhao Cai <caizhaoff@gmail.com>
      # ---
      # 
      }.unindent

      valid_yaml = YAML.load([
        "---",
        "FileName : extract_sh"                                ,
        "Desc     : extract shell functions from shell script" ,
        "Author   : Zhao Cai <caizhaoff@gmail.com>"
      ].join("\n"))

      front_matters = @fm.extract(code)

      YAML.load(front_matters[0]).should == valid_yaml
    end

  end
end



