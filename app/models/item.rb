class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price
    validates :user_id, foreign_key: true
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    
  end

end
