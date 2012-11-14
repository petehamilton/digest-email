module DigestEmail
  class DigestParser
    def self.parse(digest)
      begin
        raise "Missing Digest Header" unless digest.has_key? "header"
        raise "Missing Digest Body" unless digest.has_key? "items"
        raise "Missing Digest Footer" unless digest.has_key? "footer"

        header = DigestEmail::DigestHeader.new parse_header(digest["header"])
        body   = DigestEmail::DigestBody.new parse_items(digest["items"])
        footer = DigestEmail::DigestFooter.new parse_footer(digest["footer"])
      rescue Exception => e
        raise "Failed to parse digest: #{e.message}"
      end
    end

    def self.parse_header(header)
      raise "Bad digest, no title" unless header.has_key? "title"

      header
    end

    def self.parse_items(items)
      raise "Missing Digest Items" if items.empty?

      items.map{|item| parse_item(item)}
    end

    def self.parse_item(item)
      raise "Missing Item List Title" unless item.has_key? "list_title"
      raise "Missing Item Image" unless item.has_key? "image"
      raise "Missing Item Title" unless item.has_key? "title"
      raise "Missing Item Body" unless item.has_key? "body"

      DigestEmail::DigestItem.new item
    end

    def self.parse_footer(footer)
      raise "Missing Signature" unless footer.has_key? "signature"
      raise "Missing Sponsors Image" unless footer.has_key? "sponsors_image"

      DigestEmail::DigestFooter.new footer
    end
  end
end
