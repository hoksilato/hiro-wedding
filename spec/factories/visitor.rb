FactoryGirl.define do
  sequence :visitor_code do |n|
    "C00#{n}"
  end

  sequence :visitor_name do |n|
    "#{Faker::Name.first_name} #{n}"
  end

  factory :visitor, class: Visitor do
    name { generate(:visitor_name) }
    code { generate(:visitor_code) }
    group
  end
end
