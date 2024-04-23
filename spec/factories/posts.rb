FactoryBot.modify do
  factory :post, class: Post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    user { association(:user) }
  end
  
end



