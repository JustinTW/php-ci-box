include_recipe "jenkins"

execute "Install phpswitch" do
    command "curl https://raw.github.com/jubianchi/phpswitch/master/bin/installer | sudo php -- --global"
end

execute "Init phpswitch" do
    command "sudo phpswitch init"
    not_if "test -d $HOME/.phpswitchrc"
end

if node['phpswitch']
    if node['phpswitch']['versions']
        node['phpswitch']['versions'].each do |version, variants|
            execute "phpswitch : Install PHP-#{version}" do
                command "sudo phpswitch php:install php-#{version} #{variants}"
                not_if "phpswitch php:list | grep 'php-#{version}\\*'"
            end

            execute "php-#{version} : create var/db" do
                command "sudo mkdir -p /usr/share/phpswitch/.phpswitch/installed/php-#{version}/var/db"
                not_if "test -d /usr/share/phpswitch/.phpswitch/installed/php-#{version}/var/db"
            end

            execute "php-#{version} : set timezone" do
                command "echo date.timezone = \"#{node[:php][:directives]["date.timezone"]}\" | sudo tee /usr/share/phpswitch/.phpswitch/installed/php-#{version}/var/db/date.ini"
                not_if "test -f /usr/share/phpswitch/.phpswitch/installed/php-#{version}/var/db/date.ini"
            end
        end
    end
end

job_name = "phpswitch"
job_config = File.join(node[:jenkins][:node][:home], "#{job_name}-config.xml")

template job_config do
    source "#{job_name}-config.xml"
end

jenkins_job job_name do
    action :create
    url "http://localhost:8080"
    config job_config
end
