FactoryGirl.define do
  sequence(:playlist_name) { |n| "#{n} Playlist" }

  factory :playlist do
    name {generate(:playlist_name)}
  end
end
