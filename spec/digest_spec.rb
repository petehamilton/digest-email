require 'spec_helper'

describe Digest do
  describe "rendering" do
    before(:each) do
      @header = mock()
      @header.stubs(:render).returns("")

      @items = mock()
      @items.stubs(:render).returns("")

      @footer = mock()
      @footer.stubs(:render).returns("")

      @digest = DigestEmail::Digest.new(@header, @items, @footer)
    end

    context "with all fields set" do
      subject { @digest.render }
      it { should include '<div class="digest">'}
    end

    it "should render header, items and footer" do
      @digest.render
      @header.should have_received(:render)
      @items.should have_received(:render)
      @footer.should have_received(:render)
    end
  end
end
