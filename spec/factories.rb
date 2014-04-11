FactoryGirl.define do
  factory :product, :class => Product do
    name "Widget"
    description "Magical product of unicorns"
    price 10.99
  end
end
