FactoryBot.define do
  factory :order_destination do
    postal_code           { '123-4567' }
    prefecture_id         { 2 }
    city                  { 'ああああ' }
    address               { 'ああああ' }
    phone_number          { '123467890' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
