require 'rails/generators/active_record'
class RolesAndPermissionsGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration
  extend ActiveRecord::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  desc 'Creates following files required for gem to your application
    roles_and_permissions initializer
    interface_accesses.yml
    Permission Model
    Role Model
    Migrations
    Locales'

  def generate_controllers
    case name.downcase
    when 'install'
      copy_initializer
      copy_interface_accesses_yml
      copy_role_model
      copy_permission_model
      copy_migrations
      copy_locales
    when 'copy_initializer'
      copy_initializer
    when 'copy_interface_accesses_yml'
      copy_interface_accesses_yml
    when 'copy_role_model'
      copy_role_model
    when 'copy_permission_model'
      copy_permission_model
    when 'copy_migrations'
      copy_migrations
    when 'copy_locales'
      copy_locales
    else
      puts 'Wrong option provided!'
    end
  end

  private

  def copy_initializer
    template 'roles_and_permissions.rb', 'config/initializers/roles_and_permissions.rb'
  end

  def copy_interface_accesses_yml
    template 'interface_accesses.yml', 'db/data/interface_accesses.yml'
  end

  def copy_role_model
    template 'models/role.rb', 'app/models/role.rb'
  end

  def copy_permission_model
    template 'models/permission.rb', 'app/models/permission.rb'
  end

  def self.next_migration_number(dir)
    Time.now.utc.strftime("%Y%m%d%H%M%S%6N")
  end

  def copy_migrations
    migration_template 'migrations/create_roles.rb', 'db/migrate/create_roles.rb'
    migration_template 'migrations/add_role_id_to_users.rb', 'db/migrate/add_role_id_to_users.rb'
    migration_template 'migrations/create_permissions.rb', 'db/migrate/create_permissions.rb'
  end

  def copy_locales
    template 'locales/roles_and_permissions.en.yml', 'config/locales/roles_and_permissions.en.yml'
  end

  def show_readme
    readme 'README' if behavior == :invoke
  end

end
