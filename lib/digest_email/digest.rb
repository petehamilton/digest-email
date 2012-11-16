require 'digest_email/digest_element'

module DigestEmail
  class Digest < DigestElement


    def initialize(header, items, footer)
      @header = header
      @items = items
      @footer = footer
      @children = [@header, @items, @footer]
    end

    def wrap(inner)
      template_filename = "templates/default.html"
      template_file = File.expand_path('../../../templates/default.html', __FILE__)
      template = File.read template_file
      template.gsub("{{content}}", "<div class=\"digest\">#{inner}</div>")
    end
  end
end
