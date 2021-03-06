FactoryGirl.define do
  factory :product, :class => Product do
    name "Widget"
    description "Magical product of unicorns"
    price 10.99
  end

  factory :user, :class => User do
    username { Faker::Internet.user_name }
    password "123"
    password_confirmation { |u| u.password }
    role "Manager"
  end
end
