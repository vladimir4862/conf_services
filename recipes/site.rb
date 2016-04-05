
directory "#{node['conf_services']['static_nginx_directory']}/static" do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  action :create
end

file '/etc/nginx/sites-available/pypiserver' do
  action :delete
end

template '/etc/nginx/sites-available/services' do
  source 'services.erb'
  owner 'root'
  group 'root'
  mode '00644'
  notifies :reload, 'service[nginx]', :delayed
end


nginx_site "services" do
  enable true
end
