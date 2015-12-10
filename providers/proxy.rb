def whyrun_supported?
  true
end

use_inline_resources

action :create do
  template "#{node['apache']['dir']}/sites-available/#{new_resource.hostname}.conf" do
    cookbook 'formatron_apache'
    source 'proxy.erb'
    variables(
      hostname: new_resource.hostname,
      proxy_pass: new_resource.proxy_pass,
      ldap: {
        auth_name: new_resource.ldap_auth_name,
        url: new_resource.ldap_url,
        bind_dn: new_resource.ldap_bind_dn,
        bind_password: new_resource.ldap_bind_password
      }
    )
  end
end
