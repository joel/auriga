require 'rails_helper'

RSpec.describe GoldbricksController, type: :controller do
  let(:user)  { create(:user_with_vault, :confirmed, subdomain: 'me') }
  let(:vault) { user.vault }

  before { sign_in user }

  before(:each) do
    @request.host = "#{vault.subdomain}.auriga.dev"
  end

  around(:each) do |example|
    Mongoid::Multitenancy.with_tenant(vault) do
      example.run
    end
  end

  let(:valid_attributes)   { attributes_for(:goldbrick) }
  let(:invalid_attributes) { valid_attributes.merge(name: nil) }
  let(:valid_session)      { {} }
  let(:params)             { { format: :html } }

  def create_goldbrick attributes
    goldbrick = Goldbrick.new valid_attributes
    assign_to_goldbrick(vault, goldbrick)
    expect { goldbrick.save }.to change(Goldbrick, :count).by(+1)
    goldbrick
  end

  describe "GET #index" do
    it "assigns all goldbricks as @goldbricks" do
      goldbrick = create_goldbrick valid_attributes
      get :index, params, valid_session
      expect(assigns(:goldbricks).to_a).to eq([goldbrick])
    end
  end

  describe "GET #show" do
    it "assigns the requested goldbrick as @goldbrick" do
      goldbrick = create_goldbrick valid_attributes
      get :show, params.merge({ id: goldbrick.to_param }), valid_session
      expect(assigns(:goldbrick)).to eq(goldbrick)
    end
  end

  describe "GET #new" do
    it "assigns a new goldbrick as @goldbrick" do
      get :new, params, valid_session
      expect(assigns(:goldbrick)).to be_a_new(Goldbrick)
    end
  end

  describe "GET #edit" do
    it "assigns the requested goldbrick as @goldbrick" do
      goldbrick = create_goldbrick valid_attributes
      get :edit, params.merge({ id: goldbrick.to_param }), valid_session
      expect(assigns(:goldbrick)).to eq(goldbrick)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Goldbrick" do
        expect {
          post :create, params.merge({ goldbrick: valid_attributes }), valid_session
        }.to change(Goldbrick, :count).by(1)
      end

      it "assigns a newly created goldbrick as @goldbrick" do
        post :create, params.merge({ goldbrick: valid_attributes }), valid_session
        expect(assigns(:goldbrick)).to be_a(Goldbrick)
        expect(assigns(:goldbrick)).to be_persisted
      end

      it "redirects to the created goldbrick" do
        post :create, params.merge({ goldbrick: valid_attributes }), valid_session
        expect(response).to redirect_to(goldbricks_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved goldbrick as @goldbrick" do
        post :create, params.merge({ goldbrick: invalid_attributes }), valid_session
        expect(assigns(:goldbrick)).to be_a_new(Goldbrick)
      end

      it "re-renders the 'new' template" do
        post :create, params.merge({ goldbrick: invalid_attributes }), valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:login) { Faker::Internet.slug }
      let(:new_attributes) { valid_attributes.merge({ login: login }) }

      it "updates the requested goldbrick" do
        goldbrick = create_goldbrick valid_attributes
        put :update, params.merge({id: goldbrick.to_param, goldbrick: new_attributes}), valid_session
        expect(goldbrick.reload.login).to eql(login)
      end

      it "assigns the requested goldbrick as @goldbrick" do
        goldbrick = create_goldbrick valid_attributes
        put :update, params.merge({id: goldbrick.to_param, goldbrick: valid_attributes}), valid_session
        expect(assigns(:goldbrick)).to eq(goldbrick)
      end

      it "redirects to the goldbrick" do
        goldbrick = create_goldbrick valid_attributes
        put :update, params.merge({id: goldbrick.to_param, goldbrick: valid_attributes}), valid_session
        expect(response).to redirect_to(goldbrick)
      end
    end

    context "with invalid params" do
      it "assigns the goldbrick as @goldbrick" do
        goldbrick = create_goldbrick valid_attributes
        put :update, params.merge({id: goldbrick.to_param, goldbrick: invalid_attributes}), valid_session
        expect(assigns(:goldbrick)).to eq(goldbrick)
      end

      it "re-renders the 'edit' template" do
        goldbrick = create_goldbrick valid_attributes
        put :update, params.merge({id: goldbrick.to_param, goldbrick: invalid_attributes}), valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested goldbrick" do
      goldbrick = create_goldbrick valid_attributes
      expect {
        delete :destroy, params.merge({id: goldbrick.to_param}), valid_session
      }.to change(Goldbrick, :count).by(-1)
    end

    it "redirects to the goldbricks list" do
      goldbrick = create_goldbrick valid_attributes
      delete :destroy, params.merge({id: goldbrick.to_param}), valid_session
      expect(response).to redirect_to(goldbricks_url)
    end
  end

end
