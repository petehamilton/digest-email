require 'spec_helper'

include DigestEmail

describe DigestItems do
  describe "rendering" do
    before(:each) do
      @item_count = 3
      @items = @item_count.times.collect do |i|
        i = mock()
        i.stubs(:render).returns("")
        i
      end

      @digest_items = DigestItems.new(@items)
      puts @items.inspect
      puts @digest_items.inspect
    end

    it "renders each digest item" do
      @digest_items.render
      @items.each do |item|
        item.should have_received(:render)
      end
    end

    it "wraps items" do
      @digest_items.render.should include '<div class="digest-email-items">'
    end
  end
end
