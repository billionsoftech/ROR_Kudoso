require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe FamilyActivitiesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # FamilyActivity. As you add validations to FamilyActivity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: 'Our Family Activity',
     description: 'The description',
     activity_template_id: nil,
     cost: 0,
     reward: 0,
     time_block: 10,
     family_id: 1,
     restricted: false
    }
  }

  let(:invalid_attributes) {
    {name: '',
     description: 'The description',
     activity_template_id: nil,
     cost: 0,
     reward: 0,
     time_block: -10,
     family_id: 1,
     restricted: false
    }  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FamilyActivitiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context 'with an authenticated user' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @family = @user.member.family
      sign_in(@user)
    end

    describe "GET index" do
      it "assigns all family_activities as @family_activities" do
        family_activity = FactoryGirl.create(:family_activity, family_id: @family.id)
        get :index, {family_id: @family.id}, valid_session
        expect(assigns(:family_activities)).to eq([family_activity])
      end
    end

    describe "GET show" do
      it "assigns the requested family_activity as @family_activity" do
        family_activity = FactoryGirl.create(:family_activity, family_id: @family.id)
        get :show, {family_id: @family.id, :id => family_activity.to_param}, valid_session
        expect(assigns(:family_activity)).to eq(family_activity)
      end
    end

    describe "GET new" do
      it "assigns a new family_activity as @family_activity" do
        get :new, {family_id: @family.id}, valid_session
        expect(assigns(:family_activity)).to be_a_new(FamilyActivity)
      end
    end

    describe "GET edit" do
      it "assigns the requested family_activity as @family_activity" do
        family_activity = FactoryGirl.create(:family_activity, family_id: @family.id)
        get :edit, {family_id: @family.id, :id => family_activity.to_param}, valid_session
        expect(assigns(:family_activity)).to eq(family_activity)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new FamilyActivity" do
          expect {
            post :create, {family_id: @family.id, :family_activity => valid_attributes}, valid_session
          }.to change(FamilyActivity, :count).by(1)
        end

        it "assigns a newly created family_activity as @family_activity" do
          post :create, {family_id: @family.id, :family_activity => valid_attributes}, valid_session
          expect(assigns(:family_activity)).to be_a(FamilyActivity)
          expect(assigns(:family_activity)).to be_persisted
        end

        it "redirects to the created family_activity" do
          post :create, {family_id: @family.id, :family_activity => valid_attributes}, valid_session
          expect(response).to redirect_to([@family,FamilyActivity.last])
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved family_activity as @family_activity" do
          post :create, {family_id: @family.id, :family_activity => invalid_attributes}, valid_session
          expect(assigns(:family_activity)).to be_a_new(FamilyActivity)
        end

        it "re-renders the 'new' template" do
          post :create, {family_id: @family.id, :family_activity => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          {name: 'Our Updated Family Activity',
           description: 'The updated description',
           time_block: 60,
           restricted: true
          }
        }

        it "updates the requested family_activity" do
          family_activity = FactoryGirl.create(:family_activity, time_block: 10, restricted: false, family_id: @family.id)
          put :update, {family_id: @family.id, :id => family_activity.to_param, :family_activity => new_attributes}, valid_session
          family_activity.reload
          expect(family_activity.time_block).to eq(60)
          expect(family_activity.restricted).to be_truthy
        end

        it "assigns the requested family_activity as @family_activity" do
          family_activity = FactoryGirl.create(:family_activity, family_id: @family.id)
          put :update, {family_id: @family.id, :id => family_activity.to_param, :family_activity => valid_attributes}, valid_session
          expect(assigns(:family_activity)).to eq(family_activity)
        end

        it "redirects to the family_activity" do
          family_activity = FactoryGirl.create(:family_activity, family_id: @family.id)
          put :update, {family_id: @family.id, :id => family_activity.to_param, :family_activity => valid_attributes}, valid_session
          expect(response).to redirect_to([@family, family_activity])
        end
      end

      describe "with invalid params" do
        it "assigns the family_activity as @family_activity" do
          family_activity = FactoryGirl.create(:family_activity, family_id: @family.id)
          put :update, {family_id: @family.id, :id => family_activity.to_param, :family_activity => invalid_attributes}, valid_session
          expect(assigns(:family_activity)).to eq(family_activity)
        end

        it "re-renders the 'edit' template" do
          family_activity = FactoryGirl.create(:family_activity, family_id: @family.id)
          put :update, {family_id: @family.id, :id => family_activity.to_param, :family_activity => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested family_activity" do
        family_activity = FactoryGirl.create(:family_activity, family_id: @family.id)
        expect {
          delete :destroy, {family_id: @family.id,:id => family_activity.to_param}, valid_session
        }.to change(FamilyActivity, :count).by(-1)
      end

      it "redirects to the family_activities list" do
        family_activity = FactoryGirl.create(:family_activity, family_id: @family.id)
        delete :destroy, {family_id: @family.id,:id => family_activity.to_param}, valid_session
        expect(response).to redirect_to(family_family_activities_url(@family))
      end
    end

  end

end