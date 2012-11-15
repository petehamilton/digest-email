require File.dirname(__FILE__) + '/digest_element'

module DigestEmail
  class Digest < DigestElement
    def initialize(header, body, footer)
      @children = [header, body, footer]
    end

    def wrap(inner)
      "<div class=''>#{inner}</div>"
    end
  end
end
