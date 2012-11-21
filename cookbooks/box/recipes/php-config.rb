template "/etc/php5/conf.d/timezone.ini" do
    source "timezone.ini.erb"
    owner "root"
    mode "0644"
end

template "/etc/php5/conf.d/phar.ini" do
    source "phar.ini.erb"
    owner "root"
    mode "0644"
end
