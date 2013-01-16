include_recipe "jenkins"

job_name = "atoum"
job_config = File.join(node[:jenkins][:node][:home], "#{job_name}-config.xml")

template job_config do
    source "#{job_name}-config.xml"
end

jenkins_job job_name do
    action :create
    url "http://localhost:8080"
    config job_config
end

job_name = "atoum-sonar"
job_config = File.join(node[:jenkins][:node][:home], "#{job_name}-config.xml")

template job_config do
    source "#{job_name}-config.xml"
end

jenkins_job job_name do
    action :create
    url "http://localhost:8080"
    config job_config
end
