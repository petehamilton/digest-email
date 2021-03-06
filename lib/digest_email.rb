require "digest_email/version"
require "digest_email/digest"
require "digest_email/digest_header"
require "digest_email/digest_items"
require "digest_email/digest_item"
require "digest_email/digest_footer"
require "digest_email/digest_parser"

module DigestEmail
  def self.parse(digest_hash)
    DigestParser.parse digest_hash
  end
end
