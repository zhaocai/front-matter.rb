= extrComment

* https://github.com/zhaocai/extrComment

== DESCRIPTION:

extract embeded info (yaml, for example ) in source code comments with
predefined format.

1. the leading comment string can be different based on the language.
2. the leading column of yaml docs must be aligned

==== Format 1

  # ---
  # Gem           : ExtrComment
  # Author        : Zhao Cai
  # Email         : caizhaoff@gmail.com
  # Tag           : [ ruby, yaml, comment ]
  # Dependence    : [ yaml, ]
  # ...

==== Format 2

  # ============= = ============================================================
  # Gem           : ExtrComment
  # Author        : Zhao Cai
  # Email         : caizhaoff@gmail.com
  # Homepage      : https://github.com/zhaocai/extrComment
  # Tag           : [ ruby, yaml, comment ]
  # Dependence    : [ yaml, ]
  # ============= = ============================================================

  # ------------- - ------------------------------------------------------------
  # Gem           : ExtrComment
  # Author        : Zhao Cai
  # Email         : caizhaoff@gmail.com
  # Homepage      : https://github.com/zhaocai/extrComment
  # Tag           : [ ruby, yaml, comment ]
  # Dependence    : [ yaml, ]
  # ------------- - ------------------------------------------------------------


== FEATURES/PROBLEMS:

*

== SYNOPSIS:

  extract yaml embeded in source code comments with predefine format.
  [TODO] (code sample of usage)

== REQUIREMENTS:

* [TODO] (list of requirements)

== INSTALL:

* [TODO] (sudo gem install, anything else)




== USAGE:

  [TODO] [options] source_file

== OPTIONS:

  -h, --help          Displays help message
  -v, --version       Display the version, then exit
  -V, --verbose       Verbose output

== DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

== LICENSE:

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
