FactoryGirl.define do
  factory :post do
    title { Faker::Book.title }
    body { Faker::Matz.quote }
    description { Faker::TwinPeaks.character }
  end
end
