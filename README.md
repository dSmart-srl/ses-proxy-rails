#SES Proxy for Rails

This gem allow you to send an header that contain the application name to ses-proxy. So you can see, in the SES Proxy WebPanel, the system from which you sent your emails.

##Install

Include `ses-proxy-rails` in your Gemfile and run `bundle install`

    gem 'ses-proxy-rails'

There is no problem if you still use Rails 2. Just add `config.gem 'ses-proxy-rails'` to `config/environment.rb`

##Usage

In many cases no configuration is necessary, but if you want you can customize the default settings by creating an initializer with this content:

    # The default application name is automatically discovered
    SesProxyRails::Config.application_name = "your_application_name"

    # With this option you can override the standard recipient with a test address.
    # This works only in development environment
    # The default value is 'false'.
    SesProxyRails::Config.replace_recipient = true

    # The default address is taken by "git config user.email" command
    SesProxyRails::Config.replacement_address = "your_email_address"

##Contributing to ses-proxy-rails

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

##Copyright

Copyright (c) 2013 Massimo Maino. See LICENSE.txt for
further details.
