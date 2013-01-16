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
        chef.add_recipe "git"
        chef.add_recipe "java"
        chef.add_recipe "build-essential"
        chef.add_recipe "maven"
        chef.add_recipe "ant"
        chef.add_recipe "mysql::server"
        chef.add_recipe "jenkins"
        chef.add_recipe "box"

        chef.add_recipe "apache2"
        chef.add_recipe "apache2::mod_php5"

        chef.add_recipe "php"
        chef.add_recipe "box::php-ext"
        chef.add_recipe "box::php-pear"

        chef.add_recipe "box::jobs"

        chef.add_recipe "sonar"
        chef.add_recipe "sonar::database_mysql"
        chef.add_recipe "box::sonar-plugin"

        chef.add_recipe "atoum"
        chef.add_recipe "atoum::dev"

        chef.add_recipe "phpswitch"
        chef.add_recipe "phpswitch::dev"

        chef.json = {
            "php" => {
                "directives" => {
                    "date.timezone" => "Europe/Paris",
                    "phar.readonly" => "Off"
                }
            },
            "phpswitch" => {
                "versions" => {
                    "5.4.9" => "--default --atoum --ctype --curl=auto",
                    "5.3.19" => "--default --atoum --ctype --curl=auto"
                }
            },
            "mysql" => {
                "bind_address"  => "0.0.0.0",
                "server_root_password" => "",
                "server_debian_password" => "",
                "server_repl_password" => "",
                "use_upstart" => false,
            },
            "sonar" => {
                "version" => "3.3",
                "jdbc_username" => "root",
                "jdbc_password" => "",
                "jdbc_url" => "jdbc:mysql://localhost:3306/sonar?useUnicode=true&amp;characterEncoding=utf8",
                "jdbc_driverClassName" => "com.mysql.jdbc.Driver",
                "jdbc_validationQuery" => "select 1",
            },
            "jenkins" => {
                "node" => {
                    "home" => "/var/lib/jenkins"
                },
                "server" => {
                    "plugins" => ["URLSCM", "git", "github", "github-api", "ghprb", "clover", "maven-plugin"]
                }
            },
            "java" => {
                "home" => "/usr/lib/jvm/java-6-openjdk-i386/jre"
            }
        }
    end

    config.vm.provision :shell, :inline => "/vagrant/provision/readme"

    config.vm.auto_port_range = 8000..9000
    config.vm.forward_port 8080, 8181, :auto => true
    config.vm.forward_port 9000, 9001, :auto => true
end
