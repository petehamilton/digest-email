require 'spec_helper'

include DigestEmail

describe DigestParser do
  before(:each) do
    @digest = YAML.load_file(File.dirname(__FILE__) + '/source/sample.yml')
  end

  describe '.parse' do
    it "should parse a valid digest" do
      expect { DigestParser.parse @digest }.to_not raise_error
    end

    it "should error if the header is missing" do
      @digest.delete "header"
      puts @digest.inspect
      expect { DigestParser.parse @digest }.to raise_error
    end

    it "should error if the 'items' is missing" do
      @digest.delete "items"
      expect { DigestParser.parse @digest }.to raise_error
    end

    it "should error if the footer is missing" do
      @digest.delete "footer"
      expect { DigestParser.parse @digest }.to raise_error
    end
  end

  describe '.parse_header' do
    before(:each) do
      @digest = YAML.load_file(File.dirname(__FILE__) + '/source/sample.yml')
      @header = @digest.delete "header"
    end

    it "should error if the title is missing" do
      @header.delete "title"
      expect { DigestParser.parse_header @header }.to raise_error
    end
  end

  describe '.parse_items' do
    before(:each) do
      @digest = YAML.load_file(File.dirname(__FILE__) + '/source/sample.yml')
      @items = @digest.delete "items"
    end

    it "should error if there are no items" do
      @items = []
      expect { DigestParser.parse_items @items }.to raise_error
    end
  end

  describe '.parse_item' do
    before(:each) do
      @digest = YAML.load_file(File.dirname(__FILE__) + '/source/sample.yml')
      @item = @digest["items"][0]
    end

    it "should error if the list title is missing" do
      @item.delete "list_title"
      expect { DigestParser.parse_item @item }.to raise_error
    end

    it "should error if the title is missing" do
      @item.delete "title"
      expect { DigestParser.parse_item @item }.to raise_error
    end

    it "should error if the image is missing" do
      @item.delete "image"
      expect { DigestParser.parse_item @item }.to raise_error
    end

    it "should error if the body is missing" do
      @item.delete "body"
      expect { DigestParser.parse_item @item }.to raise_error
    end
  end

  describe '.parse_footer' do
    before(:each) do
      @digest = YAML.load_file(File.dirname(__FILE__) + '/source/sample.yml')
      @footer = @digest.delete "footer"
    end

    it "should error if the signature is missing" do
      @footer.delete "signature"
      expect { DigestParser.parse_footer @footer }.to raise_error
    end

    it "should error if the sponsors image is missing" do
      @footer.delete "sponsors_image"
      expect { DigestParser.parse_footer @footer }.to raise_error
    end
  end

end
