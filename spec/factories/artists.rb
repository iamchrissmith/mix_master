FactoryGirl.define do
  sequence(:name) { |n| "#{n} Artist" }

  factory :artist do
    name
    image_path "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end
end
