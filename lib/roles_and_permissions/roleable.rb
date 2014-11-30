module Roleable


  extend ActiveSupport::Concern
  included do

    validates :name,
              presence: true,
              length: {minimum: 1, maximum: 50},
              uniqueness: true,
              format: {with: /\A\w[\w\s\.-]*\w\z/}

    has_one :permission, as: :resource
    has_many :users

    accepts_nested_attributes_for :permission

  end

end
