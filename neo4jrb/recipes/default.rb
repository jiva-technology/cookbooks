#
# Cookbook Name:: jruby
# Recipe:: default
#
# Copyright 2009, Jiva Technology
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "jruby"

# For some reason it appears this doesn't use the jruby version of gem 
# even though it is first in the PATH
# TODO create a jruby_gem_package and use that
# gem_package "neo4j"

bash "install-neo4jrb" do
  code "sudo #{node[:jruby][:bin]}/jruby -S gem install neo4j"
end
