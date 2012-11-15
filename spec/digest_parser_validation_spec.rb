require 'spec_helper'

include DigestEmail

describe DigestParser do
  describe "parsing validation" do
    describe '.valid_index?' do
      it "should pass a valid hash" do
        hash = {"key" => "value"}
        DigestParser.valid_index?(hash, "key").should be_true
      end

      it "should return false for missing key" do
        hash = {}
        DigestParser.valid_index?(hash, "key").should be_false
      end

      it "should return false for nil key" do
        hash = {"key" => ""}
        DigestParser.valid_index?(hash, "key").should be_false
      end

      it "should return false for blank key" do
        hash = {"key" => ""}
        DigestParser.valid_index?(hash, "key").should be_false
      end
    end

    describe '.validate_index' do
      it "should pass a valid hash" do
        hash = {"key" => "value"}
        expect { DigestParser.validate_index(hash, "key") }.to_not raise_error
      end

      # DRY this with each
      it "should error on invalid hash" do
        expect { DigestParser.validate_index({}, "key") }.to raise_error
        expect { DigestParser.validate_index({"key" => ""}, "key") }.to raise_error
        expect { DigestParser.validate_index({"key" => nil}, "key") }.to raise_error
      end
    end

    describe '.validate_indices' do
      it "should pass a valid hash" do
        hash = {"key" => "value", "key2" => "value2"}
        expect { DigestParser.validate_indices(hash, ["key", "key2"]) }.to_not raise_error
      end

      # Context Invalid Hash
      # DRY keys and use each for hashes
      it "should error on invalid hash" do
        expect { DigestParser.validate_indices({}, ["key", "key2"]) }.to raise_error
        expect { DigestParser.validate_indices({"key" => ""}, ["key", "key2"]) }.to raise_error
        expect { DigestParser.validate_indices({"key" => nil}, ["key", "key2"]) }.to raise_error
        expect { DigestParser.validate_indices({"key" => "value"}, ["key", "key2"]) }.to raise_error
      end
    end
  end
end
