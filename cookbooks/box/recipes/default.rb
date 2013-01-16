include_recipe "apt"

package "curl"
package "zsh"
package "vim"
package "screen"

execute "Install Oh My ZSH for user vagrant" do
    command "curl https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo -iu vagrant bash && rm -f ~vagrant/.zshrc"
    not_if "test -d ~vagrant/.oh-my-zsh"
end

template "/home/vagrant/.oh-my-zsh/themes/jubianchi.zsh-theme" do
    source "jubianchi.zsh-theme"
    owner "vagrant"
    group "vagrant"
    not_if "test -f ~vagrant/.oh-my-zsh/themes.jubianchi.zsh-theme"
end

template "/home/vagrant/.zshrc" do
    source ".zshrc"
    owner "vagrant"
    group "vagrant"
    not_if "test -f ~vagrant/.zshrc"
end

execute "Change vagrant default shell" do
    command "sudo chsh -s /bin/zsh vagrant"
    not_if "cat /etc/passwd | grep vagrant | grep -o zsh"
end

execute "Change jenkins default shell" do
     command "sudo chsh -s /bin/bash jenkins"
     not_if "cat /etc/passwd | grep jenkins | grep -o bash"
end

template "/etc/motd.tail" do
    source "php.logo"
end
