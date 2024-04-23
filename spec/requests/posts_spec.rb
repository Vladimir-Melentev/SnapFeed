# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:tag) { create(:tag) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new post' do
        expect do
          post :create, params: { post: attributes_for(:post, user_id: user.id) }
        end.to change(Post, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new post' do
        expect do
          post :create, params: { post: attributes_for(:post, title: nil, user_id: user.id) }
        end.not_to change(Post, :count)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested post' do
        patch :update, params: { id: post.id, post: { title: 'New Title' } }
        post.reload
        expect(post.title).to eq('New Title')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the requested post' do
        patch :update, params: { id: post.id, post: { title: nil } }
        post.reload
        expect(post.title).not_to be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post = create(:post, user: user)
      expect do
        delete :destroy, params: { id: post.id }
      end.to change(Post, :count).by(-1)
    end
  end
end
