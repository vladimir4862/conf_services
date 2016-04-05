default['openssh']['server']['password_authentication'] = 'no'
default['openssh']['server']['permit_root_login'] = 'no'

default['conf_services']['htpassword_directory'] = '/etc/nginx/htpassword'
default['conf_services']['site_port'] = '443'
default['conf_services']['static_nginx_directory'] = '/var/www'
default['conf_services']['pypi_address'] = '127.0.0.1'
default['conf_services']['pypi_port'] = '8085'
default['conf_services']['chef_port'] = '444'
