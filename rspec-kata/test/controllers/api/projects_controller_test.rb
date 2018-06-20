require 'test_helper'

class Api::ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_project = api_projects(:one)
  end

  test "should get index" do
    get api_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_api_project_url
    assert_response :success
  end

  test "should create api_project" do
    assert_difference('Api::Project.count') do
      post api_projects_url, params: { api_project: {  } }
    end

    assert_redirected_to api_project_url(Api::Project.last)
  end

  test "should show api_project" do
    get api_project_url(@api_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_project_url(@api_project)
    assert_response :success
  end

  test "should update api_project" do
    patch api_project_url(@api_project), params: { api_project: {  } }
    assert_redirected_to api_project_url(@api_project)
  end

  test "should destroy api_project" do
    assert_difference('Api::Project.count', -1) do
      delete api_project_url(@api_project)
    end

    assert_redirected_to api_projects_url
  end
end
