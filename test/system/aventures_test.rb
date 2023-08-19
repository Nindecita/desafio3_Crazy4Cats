require "application_system_test_case"

class AventuresTest < ApplicationSystemTestCase
  setup do
    @aventure = aventures(:one)
  end

  test "visiting the index" do
    visit aventures_url
    assert_selector "h1", text: "Aventures"
  end

  test "should create aventure" do
    visit aventures_url
    click_on "New aventure"

    fill_in "Description", with: @aventure.description
    fill_in "Image", with: @aventure.image
    fill_in "Title", with: @aventure.title
    click_on "Create Aventure"

    assert_text "Aventure was successfully created"
    click_on "Back"
  end

  test "should update Aventure" do
    visit aventure_url(@aventure)
    click_on "Edit this aventure", match: :first

    fill_in "Description", with: @aventure.description
    fill_in "Image", with: @aventure.image
    fill_in "Title", with: @aventure.title
    click_on "Update Aventure"

    assert_text "Aventure was successfully updated"
    click_on "Back"
  end

  test "should destroy Aventure" do
    visit aventure_url(@aventure)
    click_on "Destroy this aventure", match: :first

    assert_text "Aventure was successfully destroyed"
  end
end
