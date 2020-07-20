require 'rails_helper'

RSpec.describe SharedVideosController, type: :controller do

  let(:shared_video) { FactoryBot.create(:shared_video) }

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
    let(:guest) { FactoryBot.create(:user) }

    before { sign_in guest }

    it 'Should created shared video object' do
      post :create, params: { 
        shared_video: { url: 'https://www.youtube.com/watch?v=LXb3EKWsInQ' } 
      }
      
      expect(flash[:notice]).to eq('Youtube video shared successfully!')
    end
  end

  context 'Failure' do
    let(:guest) { FactoryBot.create(:user) }
    
    before { 
      sign_in guest
    }

    it 'Should throw an error if same URL is shared again' do
      shared_video = FactoryBot.create(:shared_video, user: guest)
      post :create, params: { 
        shared_video: { url: 'https://www.youtube.com/watch?v=LXb3EKWsInQ' } 
      }

      expect(flash[:alert][0]).to eq('Url  has already been shared!')
    end

    it 'Should throw an error if provider is not youtube' do
      post :create, params: { 
        shared_video: { url: 'https://www.dailymotion.com/video/x7oi9om' } 
      }

      expect(flash[:alert][0]).to eq('Provider is not included in the list')
    end
  end
end
