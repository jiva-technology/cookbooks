maintainer        "Peter Ferne, Jiva Technology"
maintainer_email  "petef@jivatechnology.com"
license           "Apache 2.0"
description       "Installs JRuby"
version           "0.1"

%w{ ubuntu debian }.each do |os|
  supports os
end

attribute "jruby",
  :display_name => "JRuby",
  :description => "Hash of JRuby attributes",
  :type => "hash"

attribute "jruby/version",
  :display_name => "JRuby version",
  :description => "Version of JRuby to download and install",
  :default => "1.4.0"

attribute "jruby/install_path",
  :display_name => "JRuby install path",
  :description => "Where to install JRuby",
  :default => "/usr/jruby"

attribute "jruby/bin",
  :display_name => "JRuby bin directory",
  :description => "JRuby executables live here",
  :default => "/usr/jruby/bin"

attribute "jruby/gem_sources",
  :display_name => "JRuby gem sources",
  :description => "Gem repositories for use by JRuby",
  :default => ["http://gems.rubyforge.org", "http://gems.github.com", "http://gems.rubyonrails.org", "http://gemcutter.org", "http://gems.opscode.com"]