require 'digest_email/digest_element'
require 'kramdown'

module DigestEmail
  class DigestHeader < DigestElement
    attr_accessor :title, :subtitle, :subsubtitle

    def initialize(header)
      super()
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
      parsed_title = Kramdown::Document.new(@title).to_html

      html = ["<div class=\"digest-email-header-title\">#{parsed_title}</div>"]

      unless @subtitle.nil?
        parsed_subtitle = Kramdown::Document.new(@subtitle).to_html
        html << ["<div class=\"digest-email-header-subtitle\">",
                 parsed_subtitle,
                 "</div>"]
      end

      unless @subsubtitle.nil?
        parsed_subsubtitle = Kramdown::Document.new(@subsubtitle).to_html
        html << ["<div class=\"digest-email-header-subsubtitle\">",
                 parsed_subsubtitle,
                 "</div>"]
      end

      html << ["<div class=\"digest-email-dot-seperator\"></div>"]

      wrap html.join("\n")
    end

    def wrap(inner)
      "<div class=\"digest-email-header\">#{inner}</div>"
    end
  end
end
