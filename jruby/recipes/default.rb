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

# The Java recipe includes Ant
include_recipe "java"

unless FileTest.exists?(node[:jruby][:install_path])
  
  remote_file "fetch-jruby" do
    path "/tmp/jruby-src-#{node[:jruby][:version]}.tar.gz"
    source "http://jruby.kenai.com/downloads/#{node[:jruby][:version]}/jruby-src-#{node[:jruby][:version]}.tar.gz"
  end

  bash "untar-jruby" do
    code "(cd /tmp; tar zxvf /tmp/jruby-src-#{node[:jruby][:version]}.tar.gz)"
  end

  bash "build-jruby" do
    code "(cd /tmp/jruby-#{node[:jruby][:version]}; ant)"
  end

  bash "install-jruby" do
    code "mv /tmp/jruby-#{node[:jruby][:version]} #{node[:jruby][:install_path]}"
  end
  
end

# Add to path (/usr/local/bin is guaranteed to be in the path for sudo)
# The trouble is that this puts the JRuby gem command ahead of the 
# MRI gem command in the path, which can cause unexpected behaviour.
# 
# bash "create-symlinks" do
#   code "for f in #{node[:jruby][:install_path]}/*; do if [ ! -e /usr/local/bin/`basename $f` ]; then sudo ln -s $f /usr/local/bin; fi; done"
# end
# 
# Create a symlink just for jruby
bash 'create-symlink' do
  code "if [ ! -e /usr/local/bin/jruby ]; then sudo ln -s #{node[:jruby][:bin]}/jruby /usr/local/bin; fi"
end

# Add our preferred gem sources
if node[:jruby].has_key?(:gem_sources)
  bash 'add-jruby-gem-sources' do
    code "sudo #{node[:jruby][:bin]}/jruby -S gem sources --clear"
    node[:jruby][:gem_sources].each do |source|
      code "sudo #{node[:jruby][:bin]}/jruby -S gem sources --add #{source}"
    end
  end
end