require "digest_email/version"
require "digest_email/digest_header"
require "digest_email/digest_body"
require "digest_email/digest_item"
require "digest_email/digest_footer"
require "digest_email/digest_parser"

module DigestEmail
  def self.parse(digest)
    DigestParser.parse digest
  end
end
