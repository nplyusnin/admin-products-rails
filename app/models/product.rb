class Product < ApplicationRecord
  has_many :property_lists, -> { order(
    PropertyList.arel_table[:position].asc.nulls_last,
    PropertyList.arel_table[:created_at].asc
  )}, dependent: :destroy

  accepts_nested_attributes_for :property_lists, allow_destroy: true
end
