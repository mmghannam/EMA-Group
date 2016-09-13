class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :orders

    def sum_pharmacy
        orderAll = orders()
        sum = 0
        orderAll.each do |order|
            sum+=(Product.find(order.product_id).price_pharmacy * order.quantity)
        end
        return sum
    end

    def sum_population
        orderAll = orders()
        sum = 0
        orderAll.each do |order|
            sum+= (Product.find(order.product_id).price_population * order.quantity)
        end
        return sum
    end
end
