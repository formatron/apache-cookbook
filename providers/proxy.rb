def whyrun_supported?
  true
end

use_inline_resources

action :create do
  template "#{node['apache']['dir']}/sites-available/#{new_resource.hostname}" do
    cookbook 'formatron_apache'
    source 'proxy.erb'
    variables(
      hostname: "#{new_resource.hostname}",
      port: new_resource.port,
      log_directory: node['apache']['log_dir'],
      ldap: {
        auth_name: new_resource.ldap_auth_name,
        url: new_resource.ldap_url,
        bind_dn: new_resource.ldap_bind_dn,
        bind_password: new_resource.ldap_bind_password
      }
    )
  end
  apache_site new_resource.hostname
end
