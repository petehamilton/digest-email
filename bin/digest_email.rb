#!/usr/bin/env ruby

require 'digest_email'
require 'optparse'

options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: digest_email [generate] [OPTIONS]"
  opt.separator  ""
  opt.separator  "Commands"
  opt.separator  "     generate: renders the email digest"
  opt.separator  ""
  opt.separator  "Required:"

  opt.on("-f","--file FILE","A digest file e.g. 2012-01-01.yml") do |template|
    options[:file] = template
  end

  opt.on("-o","--output FILE","The file to output the html to e.g index.html") do |output|
    options[:output] = output
  end

  opt.separator  ""

  opt.separator  "Optional:"

  opt.on("-t","--template FILE","an HTML file with a {{content}} template tag") do |template|
    options[:template] = template
  end

  opt.on("-h","--help","help") do
    puts opt_parser
  end
end


begin
  opt_parser.parse!(ARGV)
  raise OptionParser::MissingArgument if options[:file].nil?

  case ARGV[0]
  when "generate"
    begin
      puts "#{Time.now} - Rendering Digest"
      digest_yaml = YAML.load_file(options[:file])

      template_file = options[:template] || File.join(File.dirname(__FILE__), "..", "templates/default.html")
      template = File.read template_file

      d = DigestEmail.parse(digest_yaml)

      File.open(options[:output], 'w') { |file| file.write(d.render template) }
    rescue Exception => e
      puts "Error generating digest: #{e}"
      exit
    end
  else
    raise
  end
rescue
  puts opt_parser
  exit
end


