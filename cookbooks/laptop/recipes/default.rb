package "git"
package "gitk"

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
