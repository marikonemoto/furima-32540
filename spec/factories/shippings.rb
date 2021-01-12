FactoryBot.define do
  factory :shipping do
    postal_code      { '123-4567' }
    area_id          { 1 }
    city             { '新宿区' }
    house_number     { '41' }
    building_name    { 'アパートメント' }
    phone_number     { '09012345678' }
    token            { 'tok_abcdefghijk00000000000000000' }
    order_id         { 1 }
    association :order
  end
end
