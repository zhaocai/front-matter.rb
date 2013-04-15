# Front Matter

* home  :: http://zhaocai.github.com/front-matter.rb/
* rdoc  :: http://rubydoc.info/gems/front-matter.rb/
* code  :: https://github.com/zhaocai/front-matter.rb
* bugs  :: https://github.com/zhaocai/front-matter.rb/issues

## DESCRIPTION:

This gem extracts embeded info (yaml front matters, for example ) in source code
comments with predefined format:

1. the leading comment string can be different based on the language.
2. the leading column of yaml docs must be aligned to be converted to yaml.

### Format 1

      # ---
      # Gem           : front_matter
      # Author        : Zhao Cai
      # Email         : caizhaoff@gmail.com
      # Tag           : [ ruby, yaml, comment ]
      # ---

### Format 2

      # ============= = ============================================================
      # Gem           : front_matter
      # Author        : Zhao Cai
      # Email         : caizhaoff@gmail.com
      # Homepage      : https://github.com/zhaocai/
      # Tag           : [ ruby, yaml, comment ]
      # ============= = ============================================================

  OR

      # ------------- - ------------------------------------------------------------
      # Gem           : front_matter
      # Author        : Zhao Cai
      # Email         : caizhaoff@gmail.com
      # Homepage      : https://github.com/zhaocai/
      # Tag           : [ ruby, yaml, comment ]
      # ------------- - ------------------------------------------------------------



## SYNOPSIS:

```ruby
require 'front_matter'
require 'awesome_print'
require "yaml"

fm = FrontMatter.new(:unindent => true, :as_yaml => true)
file = "README.md"


ap YAML.load(fm.extract_file(file)[:valid][0])

# {
#   "Gem"      => "front_matter",
#   "Author"   => "Zhao Cai",
#   "Email"    => "caizhaoff@gmail.com",
#   "Homepage" => "https://github.com/zhaocai/",
#   "Tag"      => [
#     "ruby",
#     "yaml",
#     "comment"
#   ]
# }


```

## INSTALL:

`gem install front-matter`



## DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

## LICENSE:

(The MIT License)

Copyright (c) 2012, Zhao Cai

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
