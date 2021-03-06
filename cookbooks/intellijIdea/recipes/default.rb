


cookbook_file "/home/tomasz/.local/share/applications/intellij.desktop" do
  source "ubuntu.intellij.desktop"
  owner "tomasz"
  backup false
  mode "0644"
end

intellij_version = "12.1.6"
"http://download.jetbrains.com/idea/ideaIU-#{intellij_version}.tar.gz"
intellij_mirror_site = "http://download.jetbrains.com/idea/ideaIU-#{intellij_version}.tar.gz"
intellij_file = "ideaIU-#{intellij_version}.tar.gz"
script "prepare_opt" do
  interpreter "bash"
  user "root"
  cwd "/tmp/"
  code <<-EOH
rm -rf /opt/intellij
mkdir /opt/intellij
chown -R tomasz /opt/intellij
chgrp -R tomasz /opt/intellij
chmod -R a+rwx /opt
EOH
  only_if do ! File.exists?("/opt/intellij/idea-IU/bin/idea.sh") end
end

script "install_intellij" do
  interpreter "bash"
  user "tomasz"
  cwd "/tmp/"
  code <<-EOH
	cd /opt/intellij
	wget #{intellij_mirror_site}
	tar -zxvf #{intellij_file}
	find . -maxdepth 1 -name "idea-IU*" -type d | head -1 | xargs -i ln -s {} idea-IU
	rm -rf ideaIU-#{intellij_version}.tar.gz
EOH
  only_if do ! File.exists?("/opt/intellij/idea-IU/bin/idea.sh") end
end



