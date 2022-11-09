class BrandSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :logo_url

  def logo_url
    rails_blob_path(object.logo, only_path: true) if object.logo.attached?
  end
end
