package "git"
package "gitk"
package "git-cola"

to_uninstall = ["unity-lens-friends",      "unity-lens-music","unity-lens-photos","unity-lens-video" ]
to_uninstall.each { |a| package a do 
	action :remove
end 
}

gem_package "git-up" do
  action :install
end

cookbook_file "/home/tomasz/.gitconfig" do
  owner "tomasz"
  group "tomasz"
  mode "0755"
  source "gitconfig"
  action :create_if_missing
end

include_recipe "intellijIdea"
