require 'test_helper'

class DebtsControllerTest < ActionController::TestCase
  setup do
    @debt = debts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:debts)
  end

  test "should create debt" do
    assert_difference('Debt.count') do
      post :create, debt: { billed_date: @debt.billed_date, cost: @debt.cost, customer_id: @debt.customer_id, payment_id: @debt.payment_id, status: @debt.status, taxes: @debt.taxes }
    end

    assert_response 201
  end

  test "should show debt" do
    get :show, id: @debt
    assert_response :success
  end

  test "should update debt" do
    put :update, id: @debt, debt: { billed_date: @debt.billed_date, cost: @debt.cost, customer_id: @debt.customer_id, payment_id: @debt.payment_id, status: @debt.status, taxes: @debt.taxes }
    assert_response 204
  end

  test "should destroy debt" do
    assert_difference('Debt.count', -1) do
      delete :destroy, id: @debt
    end

    assert_response 204
  end
end
