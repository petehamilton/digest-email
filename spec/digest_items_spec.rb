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

      puts @items.inspect

      @digest_items = DigestItems.new(@items)
    end

    it "renders each digest item" do
      @digest_items.render
      @items.each do |item|
        puts item.inspect
        item.should have_received(:render)
      end
    end

    it "wraps items" do
      @digest_items.render.should include '<div class="digest-email-items">'
    end
  end
end
