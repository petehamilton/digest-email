require 'spec_helper'

describe DigestParser do
  describe "parsing" do
    let(:digest_parser) { DigestEmail::DigestParser }
    let(:digest_header) { DigestEmail::DigestHeader }
    let(:digest_items) { DigestEmail::DigestItems }
    let(:digest_item) { DigestEmail::DigestItem }
    let(:digest_footer) { DigestEmail::DigestFooter }

    describe '.parse_header' do
      before(:each) do
        @header = {}
        @key = "title"

        digest_parser.stubs(:validate_index)
        digest_header.stubs(:new)
        digest_parser.parse_header(@header)
      end

      it "should call validate_index on title" do
        digest_parser.should have_received(:validate_index).with(@header, @key)
      end

      it "should build a digest header" do
        digest_header.should have_received(:new).with(@header)
      end
    end

    describe '.parse_items' do
      before(:each) do
        item = {}
        @item_count = 3
        @items = [item] * @item_count

        digest_parser.stubs(:parse_item).returns(item)
        digest_items.stubs(:new)
        digest_parser.parse_items(@items)
      end

      it "should parse each item" do
        digest_parser.should have_received(:parse_item).times(@item_count)
      end

      it "should build a digest item list" do
        digest_items.should have_received(:new).with(@items)
      end
    end

    describe '.parse_item' do
      before(:each) do
        @item = {}
        @keys = ["list_title", "image", "title", "body"]

        digest_parser.stubs(:validate_indices)
        digest_item.stubs(:new)
        digest_parser.parse_item(@item)
      end

      it "should validate item fields" do
        digest_parser.should have_received(:validate_indices).with(@item, @keys)
      end

      it "should build a digest item" do
        digest_item.should have_received(:new).with(@item)
      end
    end

    describe '.parse_footer' do
      before(:each) do
        @footer = {}
        @keys = ["signature", "sponsors_image"]

        digest_parser.stubs(:validate_indices)
        digest_footer.stubs(:new)
        digest_parser.parse_footer(@footer)
      end

      it "should validate footer fields" do
        digest_parser.should have_received(:validate_indices).with(@footer, @keys)
      end

      it "should build a digest footer" do
        digest_footer.should have_received(:new).with(@footer)
      end
    end
  end
end
