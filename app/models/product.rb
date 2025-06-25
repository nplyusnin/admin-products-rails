class Product < ApplicationRecord
  has_many :property_lists, dependent: :destroy

  accepts_nested_attributes_for :property_lists, allow_destroy: true
end
