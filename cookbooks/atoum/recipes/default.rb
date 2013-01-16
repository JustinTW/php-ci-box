include_recipe "jenkins"

execute "Install/Update atoum" do
    command "curl -s https://raw.github.com/atoum/atoum-installer/master/installer | sudo php -- --global"
end

if node[:jenkins][:node][:home]
    atoum_config = File.join(node[:jenkins][:node][:home], ".atoum.php")

    template atoum_config do
        source ".atoum.php"
        owner "jenkins"
        group "jenkins"
        not_if "test -f #{node['jenkins']['server']['home']}/.atoum.php"
    end
end
