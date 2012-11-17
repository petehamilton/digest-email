require 'spec_helper'

include DigestEmail

describe DigestHeader do
  describe "rendering" do
    before(:each) do
      header = {
        "title" => "TITLE",
        "subtitle" => "SUBTITLE",
        "subsubtitle" => "SUB2TITLE"
      }

      digest_item = mock()
      digest_item.stubs(:list_title).returns("ITEM_LIST_TITLE")

      @items = [digest_item]

      @header = DigestHeader.new(header)
    end

    context "with all fields set" do
      subject { @header.render(@items) }
      it { should include '<div class="digest-email-header">'}

      it { should include '<div class="digest-email-header-title">'}
      it { should include 'TITLE'}

      it { should include '<div class="digest-email-header-subtitle">'}
      it { should include 'SUBTITLE'}

      it { should include '<div class="digest-email-header-subsubtitle">'}
      it { should include 'SUB2TITLE'}

      it { should include '<div class="digest-email-header-contents-list">'}
      it { should include 'ITEM_LIST_TITLE'}
    end

    context "with a missing subtitle" do
      subject do
        @header.subtitle = nil
        @header.render(@items)
      end

      it { should include '<div class="digest-email-header">'}

      it { should include '<div class="digest-email-header-title">'}
      it { should include 'TITLE'}

      it { should_not include '<div class="digest-email-header-subtitle">'}
      it { should_not include 'SUBTITLE'}

      it { should include '<div class="digest-email-header-subsubtitle">'}
      it { should include 'SUB2TITLE'}

      it { should include '<div class="digest-email-header-contents-list">'}
      it { should include 'ITEM_LIST_TITLE'}
    end

    context "with a missing subsubtitle" do
      subject do
        @header.subsubtitle = nil
        @header.render(@items)
      end

      it { should include '<div class="digest-email-header">'}

      it { should include '<div class="digest-email-header-title">'}
      it { should include 'TITLE'}

      it { should include '<div class="digest-email-header-subtitle">'}
      it { should include 'SUBTITLE'}

      it { should_not include '<div class="digest-email-header-subsubtitle">'}
      it { should_not include 'SUB2TITLE'}

      it { should include '<div class="digest-email-header-contents-list">'}
      it { should include 'ITEM_LIST_TITLE'}
    end
  end
end
