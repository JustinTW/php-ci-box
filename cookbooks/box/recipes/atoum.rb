execute "Install atoum" do
    command "curl -s https://raw.github.com/jubianchi/atoum-installer/master/installer | sudo php -- --global --phar"
    not_if "which atoum"
end
