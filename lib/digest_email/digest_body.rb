require File.dirname(__FILE__) + '/digest_element'

module DigestEmail
  class DigestBody < DigestElement
    def initialize(body)
      @body = body
    end

    def render
      # body markdown -> HTML
    end

    def wrap(inner)
      "<div class='digest-email-body'>#{inner}</div>"
    end
  end
end
