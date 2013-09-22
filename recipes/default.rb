#
# Cookbook Name:: devenvset
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vim_chef::source"
include_recipe "build-essential::default"
include_recipe "cmake::default"

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
git_name   = node['devenvset']['git']['username']
git_email  = node['devenvset']['git']['email']
git_cache_creds = node['devenvset']['git']['cache_credentials']

move_file ".bash_profile", file_owner, file_group
move_file ".bashrc", file_owner, file_group
move_file ".vimrc", file_owner, file_group
move_file ".tmux.conf", file_owner, file_group

bash "install_vundle" do
	user "#{file_owner}"
	cwd "/home/#{file_owner}"
	code <<-EOH
	if [ ! -d /home/#{file_owner}/.vim/bundle ]; then
	git clone https://github.com/gmarik/vundle.git /home/#{file_owner}/.vim/bundle/vundle
	fi
	EOH
end

bash "install_colors" do
	user "#{file_owner}"
	cwd "/home/#{file_owner}"

	code <<-EOH
	if [ ! -d /home/#{file_owner}/.vim/colors  ]; then
	git clone https://github.com/chriskempson/tomorrow-theme /home/#{file_owner}/.vim/tomorrow-theme

	mv /home/#{file_owner}/.vim/tomorrow-theme/vim/colors /home/#{file_owner}/.vim
	sudo cp /home/#{file_owner}/.vim/colors/* /usr/share/vim/vimcurrent/colors

	rm -rf /home/#{file_owner}/.vim/tomorrow-theme
	rm -rf /home/#{file_owner}/.vim/colors
	fi
	EOH
end

bash "install_tmux_powerline" do
	user "#{file_owner}"
	cwd "/home/#{file_owner}"
	
	code <<-EOH
	if [ ! -d /home/#{file_owner}/.tmux_powerline ]; then
	git clone git://github.com/erikw/tmux-powerline.git /home/#{file_owner}/.tmux_powerline
	fi
	EOH
end

#bash "bundle_install" do
#	user "#{file_owner}"
#	cwd "/home/#{file_owner}"
#
#	code <<-EOH
#	vim +BundleInstall +qa
#	EOH
#end

bash "configure_git" do
	user "#{file_owner}"
	cwd "/home/#{file_owner}"

	code <<-EOH
	git config --global user.name "#{git_name}"
	git config --global user.email "#{git_email}"
	git config --global credential.helper "cache --timeout=#{git_cache_creds}"
	git config --global grep.linenumber 'true'
	git config --global grep.extendedRegExp 'true'
	EOH
end
