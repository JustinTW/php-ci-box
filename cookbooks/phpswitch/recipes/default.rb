package "curl"
package "re2c"
execute "sudo apt-get -y build-dep php5"

execute "Install/Update phpswitch" do
    command "curl https://raw.github.com/jubianchi/phpswitch/master/bin/installer | sudo php -- --global"
end

execute "Init phpswitch" do
    command "sudo phpswitch init"
end


node['phpswitch']['versions'].each do |version, options|
    execute "phpswitch : Install PHP-#{version}" do
        command "sudo phpswitch php:install #{version} #{options}"
        not_if "test -d /usr/share/phpswitch/.phpswitch/installed/php-#{version}/var/db"
    end

    execute "PHP #{version} : create var/db" do
        command "sudo mkdir -p /usr/share/phpswitch/.phpswitch/installed/php-#{version}/var/db"
        not_if "test -d /usr/share/phpswitch/.phpswitch/installed/php-#{version}/var/db"
    end

    execute "PHP #{version} : set timezone" do
        command "echo date.timezone = \"#{node[:php][:directives]["date.timezone"]}\" | sudo tee /usr/share/phpswitch/.phpswitch/installed/php-#{version}/var/db/date.ini"
        not_if "test -f /usr/share/phpswitch/.phpswitch/installed/php-#{version}/var/db/date.ini"
    end
end
