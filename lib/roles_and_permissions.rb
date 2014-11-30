%w(
  version
  roles_and_permissions_filter
  authorizable
  roleable
  permissible
).each { |file| require File.join(File.dirname(__FILE__), 'roles_and_permissions', file) }

module RolesAndPermissions
  class Engine < Rails::Engine
  end
end
