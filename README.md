# DigestEmail

This is a project put together in a weekend by [Peter Hamilton](http://peterhamilton.github.com). The aim was to simplify the process of generating weekly Computing Society emails for students.

## Background
  I'm responsible for collating together around 4-6 notices which need to go out to our students each week for jobs/clubs/meetings/events.

  I currently have to write raw HTML for each email which involves a lot of Copy-Paste and inline styles and this weekend I decided to find a way to automate the process.

  I just collated and generated this weeks digest using this method and I've gone from **2 hours** down to **5 minutes**. I'd call that a success.

## Installation

Add this line to your application's Gemfile:

    gem 'digest_email'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install digest_email

## Usage

### 1. Write a digest file
I name mine something like 2012-01-01.yml.

A digest file must consist of 3 main sections, a header, items and a footer.

- Header
Must contain:
  - `title` - The main digest title
  - `subtitle` - Optional
  - `subsubtitle` - Optional

- Items
Contains a list of items, each of which must contain:

    - `list_title` - The title which appears in the digest summary at the top
    - `image` - A full url to a hosted image (150px wide recommended)
    - `title` - The title for the item
    - `body` - The body for the item

Fields are parsed using markdown so the body can be easily customised

- Footer
Must contain:
  - `signature` - Will be aligned to the right e.g. "DocSoc 2012/2013"
  - `sponsors_image` - A 600px wide hosted image for the bottom of the email

An example Digest file could look something like this: ([github gist](https://gist.github.com/4092848)):

### 2. Write a template
An HTML file. The digest email renderer will look for the tag {{content}} and replace it with generated digest html.

If you need to add styling, you may do so in the header and it will be converted to inline styles for email client compatibility.

You can see a sample template at [https://peterhamilton.github.com/digest-email/blob/master/templates/default.html]

### 3. Generate

In the command line type `digest_email -h` to see a list of commands

```bash
digest_email -h
Usage: digest_email [generate] [OPTIONS]

Commands
     generate: renders the email digest

Required:
    -f, --file FILE                  A digest file e.g. 2012-01-01.yml
    -o, --output FILE                The file to output the html to e.g index.html

Optional:
    -t, --template FILE              an HTML file with a {{content}} template tag
    -w, --warnings                   if present, will show premailer warnings
    -h, --help                       help
```

For example to generate a digest email from [this template file](https://peterhamilton.github.com/digest-email/blob/master/templates/default.html) (template.html locally) and [this digest file](https://gist.github.com/4092848) (2012-01-01.yml locally) you would type the following:

```bash
digest_email -f 2012-01-01.yml -t template.html -o 2012-01-01_digest.html
```

Which results in the file you can see [here](http://docsoc.s3.amazonaws.com/sample/sample_digest_email.html). From there it's easy to send it out as an email.

## Contributing
This is a project put together in a few days in my spare time for a fairly specific use case, however if you do see improvements which could be made, I'd love to have people contribute.

Just follow the following recommended process:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
