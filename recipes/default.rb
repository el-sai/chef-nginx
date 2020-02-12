package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

cookbook_file "/usr/share/nginx/html/index.html" do
  source "index.html"
  mode "0644"
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
  verify 'nginx -t'
  notifies :restart, "service[nginx]"
end
