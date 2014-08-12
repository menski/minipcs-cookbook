#
# Cookbook Name:: minipcs
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright (c) 2014 Sebastian Menski
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

execute 'change root password' do
  command 'echo "root:root" | chpasswd'
  action :run
end

cookbook_file 'tmux.conf' do
  path '/etc/tmux.conf'
  action :create
end

directory '/usr/share/vim/backup' do
  owner 'root'
  group 'root'
  mode '00777'
  action :create
end

directory '/usr/share/vim/swap' do
  owner 'root'
  group 'root'
  mode '00777'
  action :create
end

directory '/usr/share/vim/undo' do
  owner 'root'
  group 'root'
  mode '00777'
  action :create
end

cookbook_file 'vimrc' do
  path '/etc/vim/vimrc.local'
  action :create
end

cookbook_file 'aliases.sh' do
  path '/etc/profile.d/aliases.sh'
  action :create
end

service "ntp" do
  provider Chef::Provider::Service::Init::Debian
end
