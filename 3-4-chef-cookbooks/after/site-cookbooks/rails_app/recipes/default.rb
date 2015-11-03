include_recipe 'database::postgresql'

# Setup PSQL user and database
connection_info = {
  host: '127.0.0.1',
  port: node['postgresql']['config']['port'],
  username: 'postgres',
  password: 'somepassword'
}

postgresql_database_user data_bag_item('rails_app', 'database')['user'] do
  connection connection_info
  password data_bag_item('rails_app', 'database')['password']
  action :create
end

postgresql_database 'rails_production' do
  connection connection_info
  action :create
end

postgresql_database_user data_bag_item('rails_app', 'database')['user'] do
  connection connection_info
  database_name 'rails_production'
  privileges [:all]
  action :grant
end

nginx_passenger_site :rails do
  dir node['rails_app']['location']
  server 'rails'
  action :create
end

# Setup Nginx Site
