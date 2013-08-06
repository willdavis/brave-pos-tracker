require 'spec_helper'

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

describe ReinforcementTimersController do

  # This should return the minimal set of attributes required to create a valid
  # ReinforcementTimer. As you add validations to ReinforcementTimer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "expires_at" => "2013-08-03 21:16:19", "control_tower_id" => 1 } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReinforcementTimersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all reinforcement_timers as @reinforcement_timers" do
      reinforcement_timer = ReinforcementTimer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:reinforcement_timers).should eq([reinforcement_timer])
    end
  end

  describe "GET show" do
    it "assigns the requested reinforcement_timer as @reinforcement_timer" do
      reinforcement_timer = ReinforcementTimer.create! valid_attributes
      get :show, {:id => reinforcement_timer.to_param}, valid_session
      assigns(:reinforcement_timer).should eq(reinforcement_timer)
    end
  end

  describe "GET new" do
    it "assigns a new reinforcement_timer as @reinforcement_timer" do
      get :new, {}, valid_session
      assigns(:reinforcement_timer).should be_a_new(ReinforcementTimer)
    end
  end

  describe "GET edit" do
    it "assigns the requested reinforcement_timer as @reinforcement_timer" do
      reinforcement_timer = ReinforcementTimer.create! valid_attributes
      get :edit, {:id => reinforcement_timer.to_param}, valid_session
      assigns(:reinforcement_timer).should eq(reinforcement_timer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ReinforcementTimer" do
        expect {
          post :create, {:reinforcement_timer => valid_attributes}, valid_session
        }.to change(ReinforcementTimer, :count).by(1)
      end

      it "assigns a newly created reinforcement_timer as @reinforcement_timer" do
        post :create, {:reinforcement_timer => valid_attributes}, valid_session
        assigns(:reinforcement_timer).should be_a(ReinforcementTimer)
        assigns(:reinforcement_timer).should be_persisted
      end

      it "redirects to the created reinforcement_timer" do
        post :create, {:reinforcement_timer => valid_attributes}, valid_session
        response.should redirect_to(ReinforcementTimer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reinforcement_timer as @reinforcement_timer" do
        # Trigger the behavior that occurs when invalid params are submitted
        ReinforcementTimer.any_instance.stub(:save).and_return(false)
        post :create, {:reinforcement_timer => { "expires_at" => "invalid value" }}, valid_session
        assigns(:reinforcement_timer).should be_a_new(ReinforcementTimer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ReinforcementTimer.any_instance.stub(:save).and_return(false)
        post :create, {:reinforcement_timer => { "expires_at" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested reinforcement_timer" do
        reinforcement_timer = ReinforcementTimer.create! valid_attributes
        # Assuming there are no other reinforcement_timers in the database, this
        # specifies that the ReinforcementTimer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ReinforcementTimer.any_instance.should_receive(:update_attributes).with({ "expires_at" => "2013-08-03 21:16:19" })
        put :update, {:id => reinforcement_timer.to_param, :reinforcement_timer => { "expires_at" => "2013-08-03 21:16:19" }}, valid_session
      end

      it "assigns the requested reinforcement_timer as @reinforcement_timer" do
        reinforcement_timer = ReinforcementTimer.create! valid_attributes
        put :update, {:id => reinforcement_timer.to_param, :reinforcement_timer => valid_attributes}, valid_session
        assigns(:reinforcement_timer).should eq(reinforcement_timer)
      end

      it "redirects to the reinforcement_timer" do
        reinforcement_timer = ReinforcementTimer.create! valid_attributes
        put :update, {:id => reinforcement_timer.to_param, :reinforcement_timer => valid_attributes}, valid_session
        response.should redirect_to(reinforcement_timer)
      end
    end

    describe "with invalid params" do
      it "assigns the reinforcement_timer as @reinforcement_timer" do
        reinforcement_timer = ReinforcementTimer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ReinforcementTimer.any_instance.stub(:save).and_return(false)
        put :update, {:id => reinforcement_timer.to_param, :reinforcement_timer => { "expires_at" => "invalid value" }}, valid_session
        assigns(:reinforcement_timer).should eq(reinforcement_timer)
      end

      it "re-renders the 'edit' template" do
        reinforcement_timer = ReinforcementTimer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ReinforcementTimer.any_instance.stub(:save).and_return(false)
        put :update, {:id => reinforcement_timer.to_param, :reinforcement_timer => { "expires_at" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reinforcement_timer" do
      reinforcement_timer = ReinforcementTimer.create! valid_attributes
      expect {
        delete :destroy, {:id => reinforcement_timer.to_param}, valid_session
      }.to change(ReinforcementTimer, :count).by(-1)
    end

    it "redirects to the reinforcement_timers list" do
      reinforcement_timer = ReinforcementTimer.create! valid_attributes
      delete :destroy, {:id => reinforcement_timer.to_param}, valid_session
      response.should redirect_to(reinforcement_timers_url)
    end
  end

end
