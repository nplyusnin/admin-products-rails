module Api
  class ProductDetailsSerializer
    private attr_reader :product

    def initialize(product)
      @product = product
    end

    def as_json
      {
        id: product.id,
        title: product.title,
        description: product.description,
        price: product.price,
        old_price: product.old_price,
        property_lists: property_lists,
        created_at: product.created_at,
        updated_at: product.updated_at
      }
    end

    private

    def property_lists
      product.property_lists.map do |property_list|
        {
          id: property_list.id,
          title: property_list.title,
          position: property_list.position,
          properties: property_list.properties.map do |property|
            {
              id: property.id,
              title: property.title,
              value: property.value,
              position: property.position
            }
          end
        }
      end
    end
  end
end
