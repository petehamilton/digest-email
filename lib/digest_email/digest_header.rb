require File.dirname(__FILE__) + '/digest_element'

module DigestEmail
  class DigestHeader < DigestElement
    def initialize(header)
      @header = header
    end

    def render
      html = ["<div class='digest-email-header-title'>#{@header["title"]}</div>"]
      if @header.has_key? "subtitle"
        html << ["<div class='digest-email-header-subtitle'>",
                 @header["subtitle"],
                 "e</div>"]
      end
      if @header.has_key? "subsubtitle"
        html << ["<div class='digest-email-header-subsubtitle'>",
                 @header["subsubtitle"],
                 "</div>"]
      end
      wrap html.join
    end

    def wrap(inner)
      "<div class='digest-email-header'>#{inner}</div>"
    end
  end
end
