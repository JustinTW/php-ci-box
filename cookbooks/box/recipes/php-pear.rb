include_recipe "php"
include_recipe "jenkins"

execute "Init PEAR" do
  command "sudo pear update-channels; sudo pear config-set auto_discover 1"
end

phpmd = php_pear_channel "pear.phpmd.org" do
  action :discover
end

pdepend = php_pear_channel "pear.pdepend.org" do
  action :discover
end

phpunit = php_pear_channel "pear.phpunit.de" do
  action :discover
end

phing = php_pear_channel "pear.phing.info" do
  action :discover
end

php_pear "PHP_Depend" do
  channel pdepend.channel_name
  preferred_state "beta"
  options "--alldeps"
  action :install
  not_if "which pdepend"
end

php_pear "PHP_PMD" do
  channel phpmd.channel_name
  action :install
  not_if "which phpmd"
end

php_pear "PHP_CodeSniffer" do
  action :install
  not_if "which phpcs"
end

php_pear "pear.phpunit.de/PHPUnit" do
  action :install
  not_if "which phpunit"
end

php_pear "phing" do
  channel phing.channel_name
  options "--alldeps"
  action :install
  not_if "which phing"
end
