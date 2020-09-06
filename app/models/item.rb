class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  VALID_HANKAKU_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: VALID_HANKAKU_REGEX, message: '半角数字を使用してください' } 
    validates :user_id
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    
  end

end
