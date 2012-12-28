include_recipe "jenkins"

execute "Install atoum" do
    command "curl -s https://raw.github.com/atoum/atoum-installer/master/installer | sudo php -- --global --phar"
    not_if "which atoum"
end

["atoum", "atoum-5.3", "atoum-5.4", "vagrant-atoum"].each do |job_name|
    job_config = File.join(node[:jenkins][:node][:home], "#{job_name}-config.xml")

    template job_config do
        source "#{job_name}-config.xml"
    end

    jenkins_job job_name do
        action :create
        url "http://localhost:8080"
        config job_config
    end
end
