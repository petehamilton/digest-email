require File.dirname(__FILE__) + '/digest_element'

module DigestEmail
  class DigestHeader < DigestElement
    attr_accessor :title, :subtitle, :subsubtitle

    def initialize(header)
      @title = header["title"]

      if header.has_key? "subtitle"
        @subtitle = header["subtitle"]
      else
        @subtitle = nil
      end

      if header.has_key? "subsubtitle"
        @subsubtitle = header["subsubtitle"]
      else
        @subsubtitle = nil
      end
    end

    def render
      html = ["<div class=\"digest-email-header-title\">#{@title}</div>"]

      unless @subtitle.nil?
        html << ["<div class=\"digest-email-header-subtitle\">",
                 @subtitle,
                 "</div>"]
      end

      unless @subsubtitle.nil?
        html << ["<div class=\"digest-email-header-subsubtitle\">",
                 @subsubtitle,
                 "</div>"]
      end

      wrap html.join
    end

    def wrap(inner)
      "<div class=\"digest-email-header\">#{inner}</div>"
    end
  end
end
