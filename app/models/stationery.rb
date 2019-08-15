class Stationery < ApplicationRecord
    before_save { self.product_code = product_code.upcase }
    default_scope -> { order(product_code: :asc) }
    enum stationery_type: [:fixed, :borrowable, :consumable]
    validates :cupboard_num, presence:true, numericality: { only_integer: true }
    validates :quantity, presence:true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :name, presence: true
    validates :product_code, presence: true
end
