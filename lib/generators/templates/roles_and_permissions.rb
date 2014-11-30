AUTHORITIES = [:full_access, :read_only, :no_access] # Make customizable

INTERFACE_ACCESSES = YAML.load_file("#{::Rails.root}/db/data/interface_accesses.yml") || {}

INTERFACES = INTERFACE_ACCESSES.keys
