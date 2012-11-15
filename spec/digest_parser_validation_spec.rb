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
      it "should validate a list of indices" do
        DigestParser.stubs(:validate_index)

        hash = {}
        keys = ["a", "b", "c"]
        DigestParser.validate_indices(hash, keys)
        keys.each do |k|
          DigestParser.should have_received(:validate_index).with(hash, k)
        end
      end
    end
  end
end
