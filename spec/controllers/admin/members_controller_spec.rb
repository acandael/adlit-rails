require 'rails_helper'

describe Admin::MembersController do
  
  before do
    @member = Member.create!(member_attributes)
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
      get :show, id: @member.id

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
      get :edit, id: @member.id

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot acces update" do
      patch :update, id: @member.id

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access destroy" do
      delete :destroy, id: @member.id

      expect(response).to redirect_to(new_session_url)
    end
  end
end

