require File.dirname(__FILE__) + '/digest_element'

module DigestEmail
  class DigestFooter < DigestElement
    def initialize(footer)
      @footer = footer
    end

    def render
      # footer HTML
    end

    def wrap(inner)
      "<div class='digest-email-footer'>#{inner}</div>"
    end
  end
end
