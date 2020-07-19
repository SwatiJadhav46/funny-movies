require 'rails_helper'

RSpec.describe SharedVideosController, type: :controller do

  let(:shared_video) { create(:shared_video) }

  before {
    @request.env["devise.mapping"] = Devise.mappings[:user]
  }

  context 'Index' do
    it 'Should list shared video list' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'Success For Logged In User' do
    let(:guest) { create(:user) }

    before { sign_in guest }

    it 'Should created shared video object' do
      post :create, params: { 
        shared_video: { url: 'https://www.youtube.com/watch?v=LXb3EKWsInQ' } 
      }
      
      expect(response.status).to eq(200)
      expect(flash[:notice]).to eq('Youtube video shared successfully!')
    end
  end

  # context 'Failure' do
  #   let(:guest) { create(:user) }
  #   let(:shared_video) { create(:shared_video, user_id: guest.id) }
    
  #   before { 
  #     sign_in guest
  #   }

  #   it 'Should created shared video object' do
  #     post :create, params: { 
  #       shared_video: { url: 'https://www.youtube.com/watch?v=LXb3EKWsInQ' } 
  #     }

  #     expect(flash[:notice]).to eq('Url has already been shared!')
  #   end
  # end
end
