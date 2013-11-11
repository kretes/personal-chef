package "git"

file "/home/tomasz/.gitconfig" do
  owner "tomasz"
  group "tomasz"
  mode "0755"
  content "
[user]
	email = kretes@gazeta.pl
	name = Tomasz Bartczak
"
  action :create_if_missing
end
