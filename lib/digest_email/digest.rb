require 'digest_email/digest_element'

module DigestEmail
  class Digest < DigestElement


    def initialize(header, items, footer)
      @header = header
      @items = items
      @footer = footer
      @children = [@header, @items, @footer]
    end

    def render(template)
      r = super()
      template.gsub('{{content}}', r)
    end

    def wrap(inner)
      "<div class=\"digest\">#{inner}</div>"
    end
  end
end
