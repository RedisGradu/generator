require 'test_helper'

class IdentitiesControllerTest < ActionController::TestCase
  setup do
    @identity = identities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:identities)
  end

  test "should create identity" do
    assert_difference('Identity.count') do
      post :create, identity: { birthdate: @identity.birthdate, citizen_no: @identity.citizen_no, customer_id: @identity.customer_id, district: @identity.district, father_name: @identity.father_name, full_name: @identity.full_name, mother_name: @identity.mother_name, place_of_birth: @identity.place_of_birth }
    end

    assert_response 201
  end

  test "should show identity" do
    get :show, id: @identity
    assert_response :success
  end

  test "should update identity" do
    put :update, id: @identity, identity: { birthdate: @identity.birthdate, citizen_no: @identity.citizen_no, customer_id: @identity.customer_id, district: @identity.district, father_name: @identity.father_name, full_name: @identity.full_name, mother_name: @identity.mother_name, place_of_birth: @identity.place_of_birth }
    assert_response 204
  end

  test "should destroy identity" do
    assert_difference('Identity.count', -1) do
      delete :destroy, id: @identity
    end

    assert_response 204
  end
end
