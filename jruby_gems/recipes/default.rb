#
# Cookbook Name:: jruby_gems
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

# Install the jruby gems listed in the json-attributes file passed to the -j 
# option of chef-solo
# FIXME For some reason this didn't work. I issued the same commands manually on 
# the command line and they worked fine. Meh.
bash 'install-jruby-gems' do
  node[:jruby_gems].each do |gem|
    code "sudo jruby -S gem install #{gem}"
  end
end
