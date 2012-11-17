# DigestEmail

This is a project put together in a weekend by [Peter Hamilton](http://peterhamilton.github.com).
The overall aim was to simplify the process of generating weekly Computing Society emails for students.

More specifically the aims were:
- **Fun** - It's not often I have time to make side projects right now. This was a nice non-uni related hack
- **Learning** - I wanted to do several things - learn more about TDD, create a command line ruby gem etc. This seemed like a great opportunity to tick the boxes
- **Consistency** - Currently everyone provides their digest info in random formats all over the place. Now they can provide the yaml config for their digest entry and I can just combine them all and generate a digest email
- **Legacy** - I wanted something future society members could use and improve on

## Background
  I'm responsible for collating together around 4-6 notices which need to go out to our students each week for jobs, clubs, meetings and events. I currently have to write raw HTML for each email which involves a lot of Copy-Paste and inline styles and this weekend I decided to find a way to automate the process.

  I just collated and generated this weeks digest using this method and it's gone from taking **2 hours** down to **5 minutes**. I'd call that a success.

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

See below for a full example, also available as a [github gist](https://gist.github.com/4092848)
```yaml
# sample_digest_email.yml
# Parses with the digest_email (http://peterhamilton.github.com/digest_email) gem
# See the result of running this file through the gem here: http://docsoc.s3.amazonaws.com/sample/sample_digest_email.html
header:
  title: "Weekly Digest"
  subtitle: November 12th 2012
  subsubtitle:

items:
    - list_title: New, Easy Email Digests
      image: https://s3-eu-west-1.amazonaws.com/docsoc/sample/suitcase.jpg
      title: We have nice simple email digests!
      body: |
        This is an example of a simple digest item.
        In this example it might be for a potential industry placement - for example, check out the rather nice suitcase image on the left

        These fields can use markdown so:

        1. We can use lists
        2. We can *italicize* and **bold** words
        3. We can easily write [links](http://peterhamilton.github.com)

    - list_title: Robotics Hackathon
      image: https://s3-eu-west-1.amazonaws.com/docsoc/sample/walle.jpg
      title: These aren't the droids you're looking for...
      body: |
        Another sample sigest item. This one is all about a fantasy hackathon!

        I imagine it would be held at Imperial and there would be more information [here](#)
        [here](#) and [here](#)

        Finally there would be the bombshell that it's **TOMORROW!**

        For more details contact *[Peter Hamilton](http://peterhamilton.github.com)*

footer:
  signature: -- DoCSoc Committee 2012
  sponsors_image: https://s3-eu-west-1.amazonaws.com/docsoc/docsocsponsors.jpg # Bottom Sponsor Banner
```

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
