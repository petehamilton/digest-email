require 'digest_email/digest_element'

module DigestEmail
  class DigestItem < DigestElement
    attr_accessor :list_title, :title, :image, :body

    def initialize(item)
      super()
      @list_title = item["list_title"]
      @title = item["title"]
      @image = item["image"]
      @body = item["body"]
    end

    def render
      parsed_body = Kramdown::Document.new(@body).to_html

      html  = [
        render_image,
        "<div class=\"digest-email-item-content-container\">",
          "<div class=\"digest-email-item-title\">#{@title}</div>",
          "<div class=\"digest-email-item-body\">#{parsed_body}</div>",
        "</div>"
      ]

      wrap html.join("\n")
    end

    def render_image
      html  = ["<div class=\"digest-email-item-image\">"]
      html << ["<img src=\"#{@image}\"/>"]
      html << ["</div>"]
      html.join("\n")
    end

    def wrap(inner)
      "<div class=\"digest-email-item\">#{inner}</div>"
    end
  end
end
