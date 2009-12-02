maintainer        "Peter Ferne, Jiva Technology"
maintainer_email  "petef@jivatechnology.com"
license           "Apache 2.0"
description       "Installs the jruby gems listed in the json attributes file passed to the -j option of chef-solo"

version           "0.1"

%w{ ubuntu debian }.each do |os|
  supports os
end
