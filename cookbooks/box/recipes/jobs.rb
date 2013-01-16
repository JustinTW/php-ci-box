include_recipe "jenkins"
include_recipe "atoum"
include_recipe "phpswitch"

["atoum-5.3", "atoum-5.4", "vagrant-atoum", "vagrant-phpunit"].each do |job_name|
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
