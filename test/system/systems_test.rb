require "application_system_test_case"

class SystemsTest < ApplicationSystemTestCase
  setup do
    @system = systems(:one)
  end

  test "visiting the index" do
    visit systems_url
    assert_selector "h1", text: "Systems"
  end

  test "creating a System" do
    visit systems_url
    click_on "New System"

    fill_in "Description", with: @system.description
    fill_in "Name", with: @system.name
    fill_in "Url", with: @system.url
    fill_in "User", with: @system.user_id
    click_on "Create System"

    assert_text "System was successfully created"
    click_on "Back"
  end

  test "updating a System" do
    visit systems_url
    click_on "Edit", match: :first

    fill_in "Description", with: @system.description
    fill_in "Name", with: @system.name
    fill_in "Url", with: @system.url
    fill_in "User", with: @system.user_id
    click_on "Update System"

    assert_text "System was successfully updated"
    click_on "Back"
  end

  test "destroying a System" do
    visit systems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "System was successfully destroyed"
  end
end
