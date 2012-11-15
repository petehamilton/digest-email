require 'spec_helper'

include DigestEmail

describe DigestHeader do
  describe "rendering" do
    before(:each) do
      @header = {
        "title" => "A Title",
        "subtitle" => "A Subtitle",
        "subsubtitle" => "A SubSubititle"
      }
      @html = DigestHeader.new(@header).render
    end

    context "with all fields set" do
      it "should render a header container div" do
        @html.include? '<div class="digest-email-header">'
      end
      it "should render a title div" do
        @html.include? '<div class="digest-email-header-title">'
      end

      it "should render a subtitle div" do
        @html.include? '<div class="digest-email-header-subtitle">'
      end

      it "should render a subsubtitle div" do
        @html.include? '<div class="digest-email-header-subsubtitle">'
      end
    end

    context "with missing fields" do
      it "no subtitle => no subtitle div" do
        !@html.include? '<div class="digest-email-header-subtitle">'
      end

      it "no subsubtitle => no subsubtitle div" do
        !@html.include? '<div class="digest-email-header-subsubtitle">'
      end
    end
  end
end
