require "application_system_test_case"

class WebhookTargetsTest < ApplicationSystemTestCase
  setup do
    @webhook_target = webhook_targets(:one)
  end

  test "visiting the index" do
    visit webhook_targets_url
    assert_selector "h1", text: "Webhook targets"
  end

  test "should create webhook target" do
    visit webhook_targets_url
    click_on "New webhook target"

    fill_in "Repository", with: @webhook_target.repository
    fill_in "Token", with: @webhook_target.token
    click_on "Create Webhook target"

    assert_text "Webhook target was successfully created"
    click_on "Back"
  end

  test "should update Webhook target" do
    visit webhook_target_url(@webhook_target)
    click_on "Edit this webhook target", match: :first

    fill_in "Repository", with: @webhook_target.repository
    fill_in "Token", with: @webhook_target.token
    click_on "Update Webhook target"

    assert_text "Webhook target was successfully updated"
    click_on "Back"
  end

  test "should destroy Webhook target" do
    visit webhook_target_url(@webhook_target)
    click_on "Destroy this webhook target", match: :first

    assert_text "Webhook target was successfully destroyed"
  end
end
