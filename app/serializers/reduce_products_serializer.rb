class ReduceProductsSerializer < ActiveModel::Serializer
  attributes :name, :price, :category, :brand, :image_url
end

def image_url:
  firstImage = nil
  if object.images.attached?
    firstImage = rails_blob_path(object.images[0], only_path: true)
  end
  firstImage
end