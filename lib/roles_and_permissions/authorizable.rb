module Authorizable

  extend ActiveSupport::Concern
  included do

    belongs_to :role
    has_one :permission, as: :resource

    accepts_nested_attributes_for :permission

  end

  def has_permission?(controller, action, authority)
    (permission.present? ? permission : role.permission).access?(controller, action, authority)
  end

  def has_control?(controller, action)
    has_permission?(controller, action, 'full_access')
  end

  def has_access?(controller, action)
    has_permission?(controller, action, 'read_only')
  end

  def has_access_or_control?(controller, action)
    has_access?(controller, action) or has_control?(controller, action)
  end

end
