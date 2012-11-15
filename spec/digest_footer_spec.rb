require 'spec_helper'

include DigestEmail

describe DigestFooter do
  describe "rendering" do
    before(:each) do
      @signature = "SOME_RANDOM_SIGNATURE"
      @sponsors_image = "SPONSORS_IMAGE_LOCATION"
      footer = {
        "signature" => @signature,
        "sponsors_image" => @sponsors_image,
      }

      @footer = DigestFooter.new(footer)
    end

    context "with all fields set" do
      subject { @footer.render }

      it { should include '<div class="digest-email-footer">'}

      it { should include '<div class="digest-email-footer-signature">'}
      it { should include @signature}

      it { should include '<div class="digest-email-footer-sponsors-image">'}
      it { should include '<img src="' + @sponsors_image + '"/>'}
    end
  end
end
