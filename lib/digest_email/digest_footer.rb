require 'digest_email/digest_element'
require 'maruku'

module DigestEmail
  class DigestFooter < DigestElement
    attr_accessor :signature, :sponsors_image

    def initialize(footer)
      super()
      @signature = footer["signature"]
      @sponsors_image = footer["sponsors_image"]
    end

    def render
      parsed_signature = Maruku.new(@signature).to_html
      html  = [
        "<div class=\"digest-email-dot-seperator\"></div>",
        "<div class=\"digest-email-footer-signature\"><div>#{parsed_signature}</div></div>",
        render_sponsors_image
      ]

      wrap html.join("\n")
    end

    def render_sponsors_image
      html  = ["<div class=\"digest-email-footer-sponsors-image\">"]
      html << ["<img src=\"#{@sponsors_image}\"/>"]
      html << ["</div>"]
      html.join("\n")
    end

    def wrap(inner)
      "<div class=\"digest-email-footer\">#{inner}</div>"
    end
  end
end
