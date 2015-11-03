nginx_passenger_site :rails do
  dir node['rails_app']['location']
  server 'rails'
  action :create
end

file "#{node['nginx_passenger']['sites_dir']}/default" do
  action :delete
  notifies :reload, 'service[nginx]'
end
