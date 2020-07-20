require 'rails_helper'

RSpec.describe Devise::SessionsController, type: :controller do

  before {
    @request.env["devise.mapping"] = Devise.mappings[:user]
  }

  context "Sign In" do
    let(:guest) { FactoryBot.create(:user) }

    context 'with valid params' do
      it 'should allow an user to log in successfully' do
        post :create, params: { user: { email: guest.email, password: guest.password } }

        expect(flash[:notice]).to eq('Signed in successfully.')
      end
    end

    context 'with invalid params' do
      it 'should not allow the user to log in' do
        post :create, params: { user: { email: guest.email, password: Faker::Internet.password } }

        expect(flash[:alert]).to eq('Invalid Email or password.')
      end
    end
  end
end
