require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/drinks", type: :request do
  let!(:admin) { create(:admin) }
  # Drink. As you add validations to Drink, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "suco de abacaxi", price: 4.00 }
  }

  let(:invalid_attributes) {
    { name: "", price: 4.00 }
  }

  before do
    sign_in admin
  end

  describe "GET /index" do
    it "renders a successful response" do
      Drink.create! valid_attributes
      get drinks_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      drink = Drink.create! valid_attributes
      get drink_url(drink)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_drink_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      drink = Drink.create! valid_attributes
      get edit_drink_url(drink)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Drink" do
        expect {
          post drinks_url, params: { drink: valid_attributes }
        }.to change(Drink, :count).by(1)
      end

      it "redirects to the created drink" do
        post drinks_url, params: { drink: valid_attributes }
        expect(response).to redirect_to(drink_url(Drink.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Drink" do
        expect {
          post drinks_url, params: { drink: invalid_attributes }
        }.to change(Drink, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post drinks_url, params: { drink: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "suco de goiaba", price: 4.00 }
      }

      it "updates the requested drink" do
        drink = Drink.create! valid_attributes
        patch drink_url(drink), params: { drink: new_attributes }
        drink.reload
        expect(drink.name).to eq("suco de goiaba")
      end

      it "redirects to the drink" do
        drink = Drink.create! valid_attributes
        patch drink_url(drink), params: { drink: new_attributes }
        drink.reload
        expect(response).to redirect_to(drink_url(drink))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        drink = Drink.create! valid_attributes
        patch drink_url(drink), params: { drink: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested drink" do
      drink = Drink.create! valid_attributes
      expect {
        delete drink_url(drink)
      }.to change(Drink, :count).by(-1)
    end

    it "redirects to the drinks list" do
      drink = Drink.create! valid_attributes
      delete drink_url(drink)
      expect(response).to redirect_to(drinks_url)
    end
  end
end
