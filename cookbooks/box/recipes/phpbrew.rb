execute "Install PHPBrew" do
    command "sudo curl -o /usr/local/bin/phpbrew https://raw.github.com/c9s/phpbrew/master/phpbrew && sudo chmod +x /usr/local/bin/phpbrew && phpbrew init && echo 'source ~/.phpbrew/bashrc' >> ~/.bashrc"
    not_if "which phpbrew"
end
