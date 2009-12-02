maintainer        "Peter Ferne, Jiva Technology"
maintainer_email  "petef@jivatechnology.com"
license           "Apache 2.0"
description       "Installs neo4j.rb"
version           "0.1"

%w{ ubuntu debian }.each do |os|
  supports os
end
