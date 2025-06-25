module Api
  class ProductPreviewSerializer
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
        created_at: product.created_at,
        updated_at: product.updated_at
      }
    end
  end
end
