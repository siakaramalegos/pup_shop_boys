require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = users(:one)
    @cart = carts(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    sign_in @user
    session[:cart_id] = @cart.id
    get :new
    assert_response :success
  end

  test "should create order" do
    sign_in @user
    assert_difference('Order.count') do
      session[:cart_id] = carts(:one).id
      post :create, order: { address: @order.address, name: @order.name, payment_type: @order.payment_type, user_id: @order.user_id }
    end

    assert_redirected_to storefront_index_path
  end

  test "should show order" do
    sign_in @user
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    sign_in @user
    patch :update, id: @order, order: { address: @order.address, name: @order.name, payment_type: @order.payment_type, user_id: @order.user_id }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    sign_in @user
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
