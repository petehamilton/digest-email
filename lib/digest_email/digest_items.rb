require 'digest_email/digest_element'

class Array
  # As per http://stackoverflow.com/questions/3676027
  def intersperse(separator)
    (inject([]) { |a,v|  a + [v,separator] })[0...-1]
  end
end

module DigestEmail
  class DigestItems < DigestElement
    def initialize(items)
      super()
      @children = items
    end

    def render
      rendered_items = @children.map(&:render)
      wrap rendered_items.join "\n<div class=\"digest-email-item-seperator\"></div>\n"
    end

    def wrap(inner)
      "<div class=\"digest-email-items\">#{inner}</div>"
    end
  end
end
