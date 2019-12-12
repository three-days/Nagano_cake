# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Admin.create!(
   email: 'admin@gmail.com',
   password: '000000'
  )


User.create!(
   email: 'test1@gmail.com',
   password: '111111',
   family_name_kanji: '山田',
   first_name_kanji: '太郎',
   family_name_kana: 'ヤマダ',
   first_name_kana: 'タロウ',
   postal_code: '1111111',
   user_address: 'tokyo',
   tele_number: '0120999333',
   leave_status: 0
)


Genre.create!(
   genre_name: 'ケーキ',
   created_at: "2019-06-09 05:58:56",
   updated_at: "2019-06-09 05:58:57"
)

Product.create!(
   genre_id: '1',
   image_id: '1',
   product_name: '長野ケーキ',
   product_description: 'これは長野ケーキです。',
   tax_excluded: '1000',
   sale_status: 'sales',
   created_at: "2019-06-09 05:58:56",
   updated_at: "2019-06-09 05:58:57"
)

Cart.create!(
   user_id: 1,
   product_id: 1,
   product_number: 1
)


Delivery.create!(
   user_id: 1,
   delivery_address: 'kyoto',
   delivery_name: 'bubuduke',
   delivery_postal_code: '2222222'
)


Order.create!(
   user_id: 1,
   total_charge: 1880,
   purchase_date: "2019-06-09 05:58:56",
   payment_methods: 1,
   order_status: 1,
   postage: 800,
   destination_address: 'osaka',
   destination_name: 'nandeya',
   destination_postal_code: '3333333'
)


OrderProduct.create!(
   order_id: '1',
   product_id: '1',
   number: '1',
   tax_included: '1080',
   production_status: 1,
   created_at: "2019-06-09 05:58:56",
   updated_at: "2019-06-09 05:58:57"
)


