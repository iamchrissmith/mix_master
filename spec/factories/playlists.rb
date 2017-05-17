FactoryGirl.define do
  sequence(:playlist_name) { |n| "#{n} Playlist" }

  factory :playlist do
    name {generate(:playlist_name)}

    factory :playlist_with_songs do
      transient do
        songs_count 3
      end

      after(:create) do |playlist, evaluator|
        create_list(:playlist_song, evaluator.songs_count, playlist: playlist)
      end
    end
  end
end
