require 'test_helper'

class PuppiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @puppy = puppies(:one)
  end

  test "should get index" do
    get puppies_url
    assert_response :success
  end

  test "should get new" do
    get new_puppy_url
    assert_response :success
  end

  test "should create puppy" do
    assert_difference('Puppy.count') do
      post puppies_url, params: { puppy: { date_of_birth: @puppy.date_of_birth, descriptin: @puppy.descriptin, name: @puppy.name } }
    end

    assert_redirected_to puppy_url(Puppy.last)
  end

  test "should show puppy" do
    get puppy_url(@puppy)
    assert_response :success
  end

  test "should get edit" do
    get edit_puppy_url(@puppy)
    assert_response :success
  end

  test "should update puppy" do
    patch puppy_url(@puppy), params: { puppy: { date_of_birth: @puppy.date_of_birth, descriptin: @puppy.descriptin, name: @puppy.name } }
    assert_redirected_to puppy_url(@puppy)
  end

  test "should destroy puppy" do
    assert_difference('Puppy.count', -1) do
      delete puppy_url(@puppy)
    end

    assert_redirected_to puppies_url
  end
end
