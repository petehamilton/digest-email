require File.dirname(__FILE__) + '/digest_element'

module DigestEmail
  class Digest < DigestElement
    def initialize(header, items, footer)
      @children = [header, items, footer]
    end

    def wrap(inner)
      "<div class=''>#{inner}</div>"
    end
  end
end
