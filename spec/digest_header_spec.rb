require 'spec_helper'

include DigestEmail

describe DigestHeader do
  describe "rendering" do
    before(:each) do
      header = {
        "title" => "A Title",
        "subtitle" => "A Subtitle",
        "subsubtitle" => "A SubSubititle"
      }

      @header = DigestHeader.new(header)
    end

    context "with all fields set" do
      subject { @header.render }
      it { should include '<div class="digest-email-header">'}
      it { should include '<div class="digest-email-header-title">'}
      it { should include '<div class="digest-email-header-subtitle">'}
      it { should include '<div class="digest-email-header-subsubtitle">'}
    end

    context "with a missing subtitle" do
      subject do
        @header.subtitle = nil
        @header.render
      end

      it { should include '<div class="digest-email-header">'}
      it { should include '<div class="digest-email-header-title">'}
      it { should_not include '<div class="digest-email-header-subtitle">'}
      it { should include '<div class="digest-email-header-subsubtitle">'}
    end

    context "with a missing subsubtitle" do
      subject do
        @header.subsubtitle = nil
        @header.render
      end

      it { should include '<div class="digest-email-header">'}
      it { should include '<div class="digest-email-header-title">'}
      it { should include '<div class="digest-email-header-subtitle">'}
      it { should_not include '<div class="digest-email-header-subsubtitle">'}
    end
  end
end
