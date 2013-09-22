#
# Cookbook Name:: devenvset
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "vim_chef::source"

def move_file filename, file_owner, file_group
	cookbook_file "/home/#{file_owner}/#{filename}" do
		source filename
		mode 0755
		owner file_owner
		group file_group
	end
end

file_owner = node['devenvset']['owner']
file_group = node['devenvset']['group']

move_file ".bashrc", file_owner, file_group
move_file ".vimrc", file_owner, file_group
move_file ".tmux.conf", file_owner, file_group
