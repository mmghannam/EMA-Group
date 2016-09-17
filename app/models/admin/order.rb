module Admin
    class Order < ActiveRecord::Base
        belongs_to :cart
        has_one :order
        validates_presence_of :cart_id, :quantity, :product_id
    end
end