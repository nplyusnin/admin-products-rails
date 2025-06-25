class PropertyList < ApplicationRecord
  belongs_to :product

  has_many :properties, -> { order(
    Property.arel_table[:position].asc.nulls_last,
    Property.arel_table[:created_at].asc
  ) }, dependent: :destroy
  accepts_nested_attributes_for :properties, allow_destroy: true
end
