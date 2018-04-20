require 'test_helper'

class ActionfoldersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actionfolder = actionfolders(:one)
  end

  test "should get index" do
    get actionfolders_url
    assert_response :success
  end

  test "should get new" do
    get new_actionfolder_url
    assert_response :success
  end

  test "should create actionfolder" do
    assert_difference('Actionfolder.count') do
      post actionfolders_url, params: { actionfolder: { action_result: @actionfolder.action_result, closing_date: @actionfolder.closing_date, folder: @actionfolder.folder, identifier: @actionfolder.identifier, lawyer: @actionfolder.lawyer, low_date: @actionfolder.low_date, status: @actionfolder.status, uf: @actionfolder.uf } }
    end

    assert_redirected_to actionfolder_url(Actionfolder.last)
  end

  test "should show actionfolder" do
    get actionfolder_url(@actionfolder)
    assert_response :success
  end

  test "should get edit" do
    get edit_actionfolder_url(@actionfolder)
    assert_response :success
  end

  test "should update actionfolder" do
    patch actionfolder_url(@actionfolder), params: { actionfolder: { action_result: @actionfolder.action_result, closing_date: @actionfolder.closing_date, folder: @actionfolder.folder, identifier: @actionfolder.identifier, lawyer: @actionfolder.lawyer, low_date: @actionfolder.low_date, status: @actionfolder.status, uf: @actionfolder.uf } }
    assert_redirected_to actionfolder_url(@actionfolder)
  end

  test "should destroy actionfolder" do
    assert_difference('Actionfolder.count', -1) do
      delete actionfolder_url(@actionfolder)
    end

    assert_redirected_to actionfolders_url
  end
end
