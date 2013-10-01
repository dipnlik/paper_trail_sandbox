# paper_trail_sandbox

Test project where I tried to isolate an issue in my main project where some PaperTrail specs were running fine from TextMate but not when using Spork/Guard.

Discovered that TextMate was running the tests just fine because it was not using Spork's DRb server.  When the project is configured to use Spork (via the `--drb` flag in `/.rspec`), most specs that use PaperTrail helpers (`be_versioned`, `with_versioning` block) fail.

I tried adding the following block to different locations in `spec/spec_helper.rb`, to the `configure` block in `config/environments/test.rb`, and to `spec/support/paper_trail.rb`, but I couldn't solve the issue.  Feel free to try again if needed.

````ruby
require 'paper_trail/frameworks/rspec'
require 'paper_trail/frameworks/rspec/extensions'
```

Steps to reproduce the issue on this project (no TextMate required):

1. `git clone`, `bundle`, `rake db:setup`
1. Run `rspec`.  All specs should pass because there's no DRb server running
1. Now run `spork`
1. Open another terminal window and `cd` to this project
1. Run `rspec` again.  It should use the DRb server and fail 4 out of 5 specs.

Steps to reproduce the issue with TextMate (1.x at least—I don't use 2.x):

1. Open the project in TextMate
1. Open `version_spec.rb` and/or `thing_spec.rb`
1. With the spork server stopped, ⌘R on either file and watch specs pass
1. Now run `spork` to have the server ready and ⌘R again and watch specs fail.
