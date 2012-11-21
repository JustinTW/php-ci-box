execute "Install sonar-php plugin" do
    command "sudo curl -o /opt/sonar/extensions/plugins/sonar-php-plugin.jar http://ci.jubianchi.fr/job/sonar-php-plugin/lastSuccessfulBuild/artifact/sonar-php-plugin/target/sonar-php-plugin-1.2-SNAPSHOT.jar"
    notifies :restart, resources(:service => "sonar")
    not_if "test -f /opt/sonar/extensions/plugins/sonar-php-plugin.jar"
end