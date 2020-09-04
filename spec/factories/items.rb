FactoryBot.define do
  factory :item do
    #content {Faker::Lorem.sentence}
    # image {"icon_b.jpg"}
    name {"シャツ"}
    description {"Yシャツ"}
    category_id {1}
    status_id {1}
    delivery_fee_id {1}
    prefecture_id {1}
    shipping_date_id {1}
    price {1000}


  end
end
