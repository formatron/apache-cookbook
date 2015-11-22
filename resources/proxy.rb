actions :create
default_action :create

attribute :hostname, name_attribute: true, kind_of: String, required: true
attribute :port, kind_of: Fixnum, required: true
attribute :ldap_auth_name, kind_of: String
attribute :ldap_url, kind_of: String
attribute :ldap_bind_dn, kind_of: String
attribute :ldap_bind_password, kind_of: String
