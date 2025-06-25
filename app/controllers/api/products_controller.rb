module Api
  class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token

    before_action :set_product, only: [ :show, :update, :destroy ]

    # GET /products
    def index
      @products = Product.all
      render json: @products.map { |product| Api::ProductPreviewSerializer.new(product).as_json }
    end

    # GET /products/:id
    def show
      render json: Api::ProductDetailsSerializer.new(@product).as_json
    end

    # POST /products
    def create
      @product = Product.new(product_params)
      if @product.save
        render json: {}, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/:id
    def update
      if @product.update(product_params)
        render json: {}, status: :ok
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/:id
    def destroy
      @product.destroy
      head :no_content
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.expect(product: [ :title, :description, :price, :old_price, property_lists_attributes: [ [ :id, :title, :position, :_destroy, properties_attributes: [ [ :id, :title, :value, :position, :_destroy ] ] ] ] ])
    end
  end
end
