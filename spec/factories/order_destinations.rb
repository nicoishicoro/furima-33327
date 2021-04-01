FactoryBot.define do
  factory :order_destination do
    postal_code           { '123-4567' }
    prefecture_id         { 2 }
    city                  { 'ああああ' }
    address               { 'ああああ' }
    building              { 'ああああ' }
    phone_number          { '1234567890' }
    token {"tok_abcdefghijk00000000000000000"}
    user_id               { 2 }
    item_id               { 2 }
  end
end
