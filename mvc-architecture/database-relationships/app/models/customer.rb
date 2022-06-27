class Customer < ApplicationRecord
  has_many :orders do
    def order_date
      date_of_orders = select(:order_date)
      dates = []
      date_of_orders.each do |date|
        dates.push(date.order_date)
      end

      dates
    end
  end
end
