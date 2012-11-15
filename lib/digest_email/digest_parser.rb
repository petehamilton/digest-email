require File.dirname(__FILE__) + '/digest_parser_validator'

module DigestEmail
  class DigestParser
    extend DigestParserValidator

    def self.parse(digest)
      begin
        validate_indices(digest, ["header", "items", "footer"])

        header = parse_header(digest["header"])
        body   = parse_items(digest["items"])
        footer = parse_footer(digest["footer"])

        DigestEmail::Digest.new(header, body, footer)
      rescue Exception => e
        raise "Failed to parse digest: #{e.message}"
      end
    end

    # No point checking for errors, want to check validate_index
    # is called for title. Ruby equivalent of spy
    # 1. Stub DigestHeader
    # 2. Spy validate_index
    # 3. Test that validate_index is called
    # 4. Test the DigestHeader stub is called
    def self.parse_header(header)
      validate_index(header, "title")
      DigestEmail::DigestHeader.new header
    end

    def self.parse_items(items)
      DigestEmail::DigestItems.new items.map{|item| parse_item(item)}
    end

    def self.parse_item(item)
      validate_indices(item, ["list_title", "image", "title", "body"])

      DigestEmail::DigestItem.new item
    end

    def self.parse_footer(footer)
      validate_indices(footer, ["signature", "sponsors_image"])
      DigestEmail::DigestFooter.new footer
    end
  end
end
