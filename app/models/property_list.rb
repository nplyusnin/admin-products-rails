class PropertyList < ApplicationRecord
  belongs_to :product

  has_many :properties, dependent: :destroy
  accepts_nested_attributes_for :properties, allow_destroy: true
end
