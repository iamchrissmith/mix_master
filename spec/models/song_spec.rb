require 'rails_helper'

RSpec.describe Song, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end
  context "associations" do
    it { should have_many(:playlist_songs) }
    it { should have_many(:playlists).through(:playlist_songs) }
  end
end
