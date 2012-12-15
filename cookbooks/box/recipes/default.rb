include_recipe "apt"
include_recipe "jenkins"

package "curl"

execute "Change jenkins default shell" do
    command "sudo chsh -s /bin/bash jenkins"
    not_if "cat /etc/passwd | grep jenkins | grep -o bash"
end
