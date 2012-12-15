include_recipe "apt"

package "curl"

execute "Change jenkins default shell" do
    command "sudo chsh -s /bin/bash jenkins"
    not_if "cat /etc/passwd | grep jenkins | grep -o bash"
end
