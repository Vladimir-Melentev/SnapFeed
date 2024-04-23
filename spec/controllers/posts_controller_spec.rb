# frozen_string_literal: true

# spec/controllers/posts_controller_spec.rb

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = FactoryBot.build(:user, password: 'P@ssword1234Q!') # Переопределить пароль
    @user.save(validate: false) # Сохранить пользователя, пропустив валидацию
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      post = FactoryBot.create(:post)
      get :show, params: { id: post.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new post' do
        expect do
          post :create, params: { post: FactoryBot.attributes_for(:post) }
        end.to change(Post, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new post' do
        expect do
          post :create, params: { post: FactoryBot.attributes_for(:post, title: nil) }
        end.to_not change(Post, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post = FactoryBot.create(:post)
      expect do
        delete :destroy, params: { id: post.to_param }
      end.to change(Post, :count).by(-1)
    end
  end
end
