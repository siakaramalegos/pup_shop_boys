class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand

  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/:style_missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  category_id        :integer
#  brand_id           :integer
#  description        :text
#  price              :decimal(, )
#  quantity           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_products_on_brand_id     (brand_id)
#  index_products_on_category_id  (category_id)
#
