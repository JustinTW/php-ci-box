execute "Install PHPBrew" do
    command "sudo curl -o /usr/local/bin/phpbrew https://raw.github.com/c9s/phpbrew/master/phpbrew && sudo chmod +x /usr/local/bin/phpbrew"
    not_if "which phpbrew"
end

execute "Update PHPBrew" do
    command "sudo phpbrew self-update"
end

execute "Init PHPBrew" do
    command "sudo -iu vagrant phpbrew init"
    not_if "test -d ~vagrant/.phpbrew"
end

execute "Init .bashrc" do
    command "\necho 'source ~/.phpbrew/bashrc\nexport PHPBREW_SET_PROMPT=1\n' >> ~vagrant/.bashrc && sudo -iu vagrant source ~vagrant/.bashrc"
    not_if "grep 'source ~/.phpbrew/bashrc' ~vagrant/.bashrc"
end

if node['phpbrew']
    if node['phpbrew']['versions']
        node['phpbrew']['versions'].each do |version, variants|
            execute "PHPBrew : Install PHP-#{version}" do
                command "sudo -iu vagrant sudo phpbrew install php-#{version} +default +dbs +apxs2=/usr/bin/apxs2"
                not_if "sudo -iu vagrant phpbrew list | grep #{version}"
            end
        end
    end
end