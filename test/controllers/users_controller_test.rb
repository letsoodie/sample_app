require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user       = users(:albert)
    @other_user = users(:timothy)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title"
  end

  test "should redirect edit when not logged in" do
    # Ici on utilise la convention rails qui défini que @user = user.id
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    # Dans ce cas, on a besoin de fournir un hash additionnel pour que la route fonctionne correctement
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
     get :index
     assert_redirected_to login_url
   end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end
end
