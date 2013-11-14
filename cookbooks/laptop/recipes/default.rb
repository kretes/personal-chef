package "git"
package "gitk"
package "git-cola"
package "htop"
package "vim"
package "gksu"

to_uninstall = ["unity-lens-friends",      "unity-lens-music","unity-lens-photos","unity-lens-video" ]
to_uninstall.each { |a| package a do 
	action :remove
end 
}

gem_package "git-up" do
  action :install
end
gem_package "berkshelf" do
  action :install
end

cookbook_file "/home/tomasz/.gitconfig" do
  owner "tomasz"
  group "tomasz"
  mode "0755"
  source "gitconfig"
  action :create_if_missing
end

node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['java']['install_flavor'] = "oracle"
node.default['maven']['version']=3


include_recipe "intellijIdea"

#include_recipe "maven::default"


node.default['scala']['url']="http://www.scala-lang.org/files/archive/scala-2.10.3.tgz"
#include_recipe "scala::default"

include_recipe "java::oracle"

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


