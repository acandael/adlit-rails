require 'rails_helper'

describe Admin::PublicationsController do

  let!(:category) { Category.create!(name: "presentaties") }
  
  before do
    @publication = Publication.create!(publication_attributes(category_id: category.id))
  end

  context "when not signed in" do
    
    before do
      session[:user_id] = nil
    end

    it "cannot access index" do
      get :index

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access show" do
      get :show, id: @publication.id

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access new" do
      get :new

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access create" do
      post :create

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access edit" do
      get :edit, id: @publication.id

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot acces update" do
      patch :update, id: @publication.id

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access destroy" do
      delete :destroy, id: @publication.id

      expect(response).to redirect_to(new_session_url)
    end
  end
end
