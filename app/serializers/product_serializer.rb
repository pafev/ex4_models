class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :price, :stock_quantity, :brand, :brand_id, :category, :images_url

  def brand
    object.brand.name
  end
  def category
    object.category.name
  end
  def images_url
    array = []
    if object.images.attached?
      for image in object.images do
        array.append(rails_blob_path(image, only_path: true))
      end
    end
    array
  end
end
