class Category < ActiveRecord::Base

  has_many :products

  has_attached_file :photo

  validates_attachment_content_type :photo,
                                    :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def products_of_children
    children_products = Product.none
    Category.where(parent_id: id()).each do |category|
      children_products += (category.products)
    end
    children_products

  end

end
