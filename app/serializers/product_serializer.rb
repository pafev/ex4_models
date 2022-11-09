class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :images_url

  def images_url
    array =[]
    if object.images.attached?
      for image in object.images do
        array.append(rails_blob_path(image, only_path: true))
      end
    end
    array
  end
end
