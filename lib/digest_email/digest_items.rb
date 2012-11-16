require 'digest_email/digest_element'

module DigestEmail
  class DigestItems < DigestElement
    def initialize(items)
      super()
      @children = items
    end

    def wrap(inner)
      "<div class=\"digest-email-items\">#{inner}</div>"
    end
  end
end
