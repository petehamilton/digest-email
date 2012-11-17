require 'digest_email/digest_element'
require 'premailer'

module DigestEmail
  class Digest < DigestElement


    def initialize(header, items, footer)
      @header = header
      @items = items
      @footer = footer
      @children = [@header, @items, @footer]
    end

    def render(template = "{{content}}", show_warnings = false)
      html = [@header.render(@items.children), @items.render, @footer.render].join
      html = template.gsub '{{content}}', wrap(html)

      # Convert any styles to inline
      premailer = Premailer.new(html, :with_html_string => true)
      html = premailer.to_inline_css

      # Output any CSS warnings
      if show_warnings
        puts "Email Client Compatibility Warnings:"
        premailer.warnings.each do |w|
          puts "#{w[:message]} (#{w[:level]}) may not render properly in #{w[:clients]}"
        end
      end
      html
    end

    def wrap(inner)
      ["<div class=\"digest\">",
       "<table>",
       "<tr>",
       "<td>",
       inner,
       "</td>",
       "</tr>",
       "</table>",
       "</div>"].join
    end
  end
end
