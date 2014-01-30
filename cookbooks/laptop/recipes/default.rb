package "git"
package "gitk"
package "git-cola"
package "htop"
package "vim"
package "gksu"
package "vlc"
package "xbmc"

apt_repository "doubleCMD" do
  uri "http://ppa.launchpad.net/alexx2000/doublecmd/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  key "6CF401B78A9D7393F7F32E7510B3F6FDBE35DEDD"
  keyserver "keyserver.ubuntu.com"
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end

execute "apt-get update" do
  action :nothing
end

package "doublecmd-gtk"

directory "/mnt/ramdisk" do
  owner "root"
  group "root"
  mode 00777
  action :create
end

mount "/mnt/ramdisk" do
	device "tmpfs"
	fstype "tmpfs"
	options "defaults,size=6G"
  action [:mount, :enable]
end

to_uninstall = ["unity-lens-friends",      "unity-lens-music","unity-lens-photos","unity-lens-video" ]
to_uninstall.each { |a| package a do 
	action :remove
end 
}

#gem_package "git-up" do
#  action :install
#end
#gem_package "berkshelf" do
#  action :install
#end

cookbook_file "/home/tomasz/.gitconfig" do
  owner "tomasz"
  group "tomasz"
  mode "0755"
  source "gitconfig"
  action :create_if_missing
end

#node.default['java']['oracle']['accept_oracle_download_terms'] = true
#node.default['java']['install_flavor'] = "oracle"
node.default['maven']['version']=3
node.default['maven']['3']['url']='http://ftp.ps.pl/pub/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz'


#include_recipe "intellijIdea"

include_recipe "maven::default"


#node.default['scala']['url']="http://www.scala-lang.org/files/archive/scala-2.10.3.tgz"
#include_recipe "scala::default"

#include_recipe "java::oracle"

#pwdhashurl="https://addons.mozilla.org/firefox/downloads/latest/1033/addon-1033-latest.xpi"
#script "pwdhash install" do
#  interpreter "bash"
#  user "root"
#  cwd "/tmp/"
#3  code <<-EOH
#	wget #{pwdhashurl}
#	gksudo firefox -install-global-extension addon-1033-latest.xpi
#EOH
#end


