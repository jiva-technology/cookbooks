jruby Mash.new unless attribute?("jruby")
jruby[:version] = "1.4.0"   unless jruby.has_key?(:version)
jruby[:install_path] = "/usr/jruby"   unless jruby.has_key?(:install_path)
jruby[:bin] = "#{jruby[:install_path]}/bin"   unless jruby.has_key?(:bin)

jruby[:gem_sources] = ["http://gems.rubyforge.org", "http://gems.github.com", "http://gems.rubyonrails.org", "http://gemcutter.org", "http://gems.opscode.com"]  unless jruby.has_key?(:gem_sources)