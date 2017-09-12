require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:my_ad) { Advertisement.create!(
    id: 1,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph, 
    price: RandomData.random_integer) }

  describe "attributes" do
    it "should respond to title" do
      expect(my_ad).to respond_to(:title)
    end

    it "should respond to body" do
      expect(my_ad).to respond_to(:body)
    end

    it "should respond to price" do
      expect(my_ad).to respond_to(:price)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_ad] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([my_ad])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be nil
    end
  end

  describe "Advertisement create" do

    it "increases the number of Advertisement by 1" do
      expect{post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_integer}}.to change(Advertisement, :count).by(1)
    end

    it "assigns the new advertisement to @advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_integer}
      expect(assigns(:advertisement)).to eq Advertisement.first
    end

    it "redirects to the new advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_integer}
      expect(response).to redirect_to Advertisement.last
    end
  end

  describe "GET #show" do
    it "returns http success" do
      #passing id: my_post.id to show as a parameter
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end

    it "assigns my_ad to @advertisement" do
      get :show, {id: my_ad.id}
      expect(assigns(:advertisement)).to eq(my_ad)
    end
  end

end
