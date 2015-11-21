include_recipe 'apache2::default'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_http'
include_recipe 'apache2::mod_ssl'

package 'libapache2-mod-authnz-external' do
  notifies :restart, 'service[apache2]', :delayed
end

execute "sudo a2enmod authn_socache"
