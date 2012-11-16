require 'digest_email/digest_element'

module DigestEmail
  class DigestItem < DigestElement
    def initialize(item)
      super()
      @list_title = item["list_title"]
      @title = item["title"]
      @image = item["image"]
      @body = item["body"]
    end

    def render
      html  = [
        render_image,
        "<div class=\"digest-email-item-content-container\">",
          "<div class=\"digest-email-item-title\">#{@title}</div>",
          "<div class=\"digest-email-item-body\">#{@body}</div>",
        "</div>"
      ]

      wrap html.join
    end

    def render_image
      html  = ["<div class=\"digest-email-item-image\">"]
      html << ["<img src=\"#{@image}\"/>"]
      html << ["</div>"]
      html.join
    end

    def wrap(inner)
      "<div class=\"digest-email-item\">#{inner}</div>"
    end
  end
end
