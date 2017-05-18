require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        expect {
          post :create, params: {playlist: attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns a newly created playlist as @playlist" do
        post :create, params: {playlist: attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to the created playlist" do
        post :create, params: {playlist: attributes_for(:playlist)}
        expect(response).to redirect_to(Playlist.last)
      end
    end
    context "with invalid params" do
      it "assigns a newly created but unsaved playlist as @playlist" do
        post :create, params: {playlist: attributes_for(:playlist, name:nil)}
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end
      it "re-renders the 'new' template" do
        post :create, params: {playlist: attributes_for(:playlist, name:nil)}
        expect(response).to render_template("new")
      end
    end
  end

end
