FactoryGirl.define do
  sequence :title do |n|
    "#{n} Title"
  end

  factory :song do
    title
    artist
  end
end
