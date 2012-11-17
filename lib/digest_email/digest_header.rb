require 'digest_email/digest_element'
require 'maruku'

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

    def render(items)
      parsed_title = Maruku.new(@title).to_html

      html = ["<div class=\"digest-email-header-title\">#{parsed_title}</div>"]

      unless @subtitle.nil?
        parsed_subtitle = Maruku.new(@subtitle).to_html
        html << ["<div class=\"digest-email-header-subtitle\">",
                 parsed_subtitle,
                 "</div>"]
      end

      unless @subsubtitle.nil?
        parsed_subsubtitle = Maruku.new(@subsubtitle).to_html
        html << ["<div class=\"digest-email-header-subsubtitle\">",
                 parsed_subsubtitle,
                 "</div>"]
      end

      # Contents List
      html << ["<div class=\"digest-email-dot-seperator\"></div>"]
      html << render_contents_list(items)
      html << ["<div class=\"digest-email-dot-seperator\"></div>"]

      wrap html.join("\n")
    end

    def render_contents_list(items)
      html =  ["<div class=\"digest-email-header-contents-list\">"]
      html << ["<ol>"]
      html << items.map { |item| "<li>#{item.list_title}</li>" }.join
      html << ["</ol>"]
      html << ["</div>"]
      html.join
    end

    def wrap(inner)
      "<div class=\"digest-email-header\">#{inner}</div>"
    end
  end
end
