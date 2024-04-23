require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    # Добавьте другие тесты, если необходимо
  end

  describe "GET #show" do
    it "returns a success response" do
      post = Post.create!(title: "Title", body: "Body")
      get :show, params: { id: post.to_param }
      expect(response).to be_successful
    end

    # Добавьте другие тесты, если необходимо
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end

    # Добавьте другие тесты, если необходимо
  end

  describe "GET #edit" do
    it "returns a success response" do
      post = Post.create!(title: "Title", body: "Body")
      get :edit, params: { id: post.to_param }
      expect(response).to be_successful
    end

    # Добавьте другие тесты, если необходимо
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: { post: { title: "Title", body: "Body" } }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post :create, params: { post: { title: "Title", body: "Body" } }
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, params: { post: { title: nil, body: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { title: "New Title" } }

      it "updates the requested post" do
        post = Post.create!(title: "Title", body: "Body")
        put :update, params: { id: post.to_param, post: new_attributes }
        post.reload
        expect(post.title).to eq("New Title")
      end

      it "redirects to the post" do
        post = Post.create!(title: "Title", body: "Body")
        put :update, params: { id: post.to_param, post: new_attributes }
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "renders the edit template" do
        post = Post.create!(title: "Title", body: "Body")
        put :update, params: { id: post.to_param, post: { title: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create!(title: "Title", body: "Body")
      expect {
        delete :destroy, params: { id: post.to_param }
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create!(title: "Title", body: "Body")
      delete :destroy, params: { id: post.to_param }
      expect(response).to redirect_to(posts_url)
    end
  end
end
