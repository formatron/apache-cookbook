node.override['apache']['default_site_enabled'] = false

include_recipe 'apache2::default'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_http'
include_recipe 'apache2::mod_authnz_ldap'
