require 'spec_helper'

include DigestEmail

describe DigestParser do
  before(:each) do
    @digest_yaml = YAML.load_file(File.dirname(__FILE__) + '/source/sample.yml')
    @digest = DigestParser.parse @digest_yaml
  end

  it "does something" do
    pending
  end
end
