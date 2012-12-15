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
                not_if "phpswitch php:list | grep 'php-#{version}\*'"
            end
        end
    end
end