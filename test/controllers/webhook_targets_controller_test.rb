require "test_helper"

class WebhookTargetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webhook_target = webhook_targets(:one)
  end

  test "should get index" do
    get webhook_targets_url
    assert_response :success
  end

  test "should get new" do
    get new_webhook_target_url
    assert_response :success
  end

  test "should create webhook_target" do
    assert_difference("WebhookTarget.count") do
      post webhook_targets_url, params: { webhook_target: { repository: @webhook_target.repository, token: @webhook_target.token } }
    end

    assert_redirected_to webhook_target_url(WebhookTarget.last)
  end

  test "should show webhook_target" do
    get webhook_target_url(@webhook_target)
    assert_response :success
  end

  test "should get edit" do
    get edit_webhook_target_url(@webhook_target)
    assert_response :success
  end

  test "should update webhook_target" do
    patch webhook_target_url(@webhook_target), params: { webhook_target: { repository: @webhook_target.repository, token: @webhook_target.token } }
    assert_redirected_to webhook_target_url(@webhook_target)
  end

  test "should destroy webhook_target" do
    assert_difference("WebhookTarget.count", -1) do
      delete webhook_target_url(@webhook_target)
    end

    assert_redirected_to webhook_targets_url
  end
end
