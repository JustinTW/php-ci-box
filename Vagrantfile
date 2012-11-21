# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    config.vm.host_name = "php-ci-box"

    config.package.name = "php-ci.box"

    config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "cookbooks"

        chef.add_recipe "apt"
        chef.add_recipe "build-essential"

        chef.add_recipe "box"

        chef.add_recipe "git"
        chef.add_recipe "java"
        chef.add_recipe "mysql::server"
        chef.add_recipe "maven"
        chef.add_recipe "ant"

        chef.add_recipe "php"
        chef.add_recipe "php::package"
        chef.add_recipe "box::php-dep"
        chef.add_recipe "box::php-config"
        chef.add_recipe "box::php-ext"
        chef.add_recipe "box::php-pear"

        chef.add_recipe "jenkins"

        chef.add_recipe "sonar"
        chef.add_recipe "sonar::database_mysql"
        chef.add_recipe "box::sonar-plugin"

        chef.add_recipe "box"

        chef.add_recipe "box::phpbrew"
        chef.add_recipe "box::atoum"

        chef.json = {
            "mysql" => {
                "bind_address"  => "0.0.0.0",
                "server_root_password" => "",
                "server_debian_password" => "",
                "server_repl_password" => ""
                "use_upstart" => false,
            },
            "sonar" => {
                "version" => "3.3",
                "jdbc_username" => "root",
                "jdbc_password" => "",
                "jdbc_url" => "jdbc:mysql://localhost:3306/sonar?useUnicode=true&amp;characterEncoding=utf8",
                "jdbc_driverClassName" => "com.mysql.jdbc.Driver",
                "jdbc_validationQuery" => "select 1",
            }
        }
    end

    config.vm.forward_port 8080, 8181
    config.vm.forward_port 9000, 9191
end
