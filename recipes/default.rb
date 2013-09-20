#
# Cookbook Name:: devenvset
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
file_owner = node['devenvset']['owner']
file_group = node['devenvset']['group']

file ".bashrc", file_owner, file_group
file ".vimrc", file_owner, file_group
file ".tmux.conf", file_owner, file_group

def file filename, file_owner, firle_group
	cookbook_file "~/#{filename}" do
		source filename
		mode 0755
		owner file_owner
		group file_group
	end
end
