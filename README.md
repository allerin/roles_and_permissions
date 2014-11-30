## RolesAndPermissions

This is a gem which provides authorization with Role specific and User specific permissions configured on the basis of interfaces.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roles_and_permissions'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roles_and_permissions

## Usage

Configure gem in application as following
```ruby
# To generate initializer and other required configuration files
rails g roles_and_permissions install
# To generate initializer
rails g roles_and_permissions copy_initializer
# To generate interface_accesses.yml
rails g roles_and_permissions copy_interface_accesses_yml
```
Configure Models as following
```ruby
class User < ActiveRecord::Base
  include Authorizable
end
```
If Role model exist then configure it as following or you can generator
```ruby
class Role < ActiveRecord::Base
  include Roleable
end
```
If Permission model exist then configure it as following or you can generator
```ruby
class Permission < ActiveRecord::Base
  include Permissible
end
```
Configure ApplicationController as following
```ruby
class ApplicationController < ActionController::Base
  include RolesAndPermissionsFilter
end
```
Overriding following defaults in ApplicationController
```ruby
FULL_ACCESS_CONTROLLER_ACTIONS = {}

def authorization_failure_path
  dashboard_users_path # Default is root_path
end
```
Configure permissions for interfaces with their respective controller actions in interface_accesses.yml
```ruby
manage_users:
  full_access:
    users:
    - dashboard
    - new
    - edit
    - show
    - destroy
    - update
    - create
    - index
  read_only:
    users:
    - index
    - show
```

## Contributing

1. Fork it ( https://github.com/Anand-Bait/roles_and_permissions/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
