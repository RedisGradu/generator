require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { customer_id: @payment.customer_id, debt_id: @payment.debt_id, payment_date: @payment.payment_date }
    end

    assert_response 201
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should update payment" do
    put :update, id: @payment, payment: { customer_id: @payment.customer_id, debt_id: @payment.debt_id, payment_date: @payment.payment_date }
    assert_response 204
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_response 204
  end
end
