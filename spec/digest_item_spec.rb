require 'spec_helper'

include DigestEmail

describe DigestItem do
  describe "rendering" do
    before(:each) do
      @list_title = "ITEM_LIST_TITLE"
      @title = "ITEM_TITLE"
      @image = "ITEM_IMAGE"
      @body = "ITEM_BODY"

      item = {
        "list_title" => @list_title,
        "title" => @title,
        "image" => @image,
        "body" => @body
      }

      @item = DigestItem.new(item)
    end

    context "with all fields set" do
      subject { @item.render }

      it { should include '<div class="digest-email-item">'}

      it { should include '<div class="digest-email-item-image">'}
      it { should include '<img src="' + @image + '"/>'}

      it { should include '<div class="digest-email-item-content-container">'}

      it { should include '<div class="digest-email-item-title">'}
      it { should include @title }

      it { should include '<div class="digest-email-item-body">'}
      it { should include @body }
    end
  end
end
