require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test "should save" do
    user = User.create(login: 'me_myself', password: '111111', password_confirmation: '111111')
    assert user.save
  end
  
  test "should signup" do
    post "/users", params: {users:{login: 'me', password: 'lolo', password_confirmation: 'lolo'}}
    get "/output", params: {n: 9000}
    assert_response :success
  end
  
  test "should login" do
    User.create(login: 'tlog', password: 'tpswd', password_confirmation: 'tpswd')
    post "/login", params: {login: 'tlog', password: 'tpswd'}
    get "/output", params: {n: '9000'}
    assert_response :success
  end
end


