module Permissible

  extend ActiveSupport::Concern
  included do

    serialize :permissions
    validates :permissions, presence: true
    belongs_to :resource, polymorphic: true

  end

  def accessible_controllers_actions
    accessible = {}
    permissions.each do |interface, authority|
      accessible[interface] = {authority => INTERFACE_ACCESSES[interface][authority]}
    end
    accessible
  end

  def access?(controller, action, authority)
    accessible_controllers_actions.invert.each do |key, interface|
      if key[authority].present? && key[authority][controller].present? && key[authority][controller].include?(action)
        return true
      end
    end
    false
  end

end
