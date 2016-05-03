require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { closing_date: @customer.closing_date, identity_id: @customer.identity_id, register_date: @customer.register_date, status: @customer.status }
    end

    assert_response 201
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should update customer" do
    put :update, id: @customer, customer: { closing_date: @customer.closing_date, identity_id: @customer.identity_id, register_date: @customer.register_date, status: @customer.status }
    assert_response 204
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_response 204
  end
end
