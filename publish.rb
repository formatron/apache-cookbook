#!/usr/bin/env ruby

require 'chef/cookbook/metadata'

category = 'Web Servers'

metadata = Chef::Cookbook::Metadata.new
metadata.from_file './metadata.rb'

`git tag v#{metadata.version}`
`git push --tags`
`chef exec knife cookbook site share '#{metadata.name}' "#{category}"`
