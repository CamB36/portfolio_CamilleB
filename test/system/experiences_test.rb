require "application_system_test_case"

class ExperiencesTest < ApplicationSystemTestCase
  setup do
    @experience = experiences(:one)
  end

  test "visiting the index" do
    visit experiences_url
    assert_selector "h1", text: "Experiences"
  end

  test "should create experience" do
    visit experiences_url
    click_on "New experience"

    fill_in "Date", with: @experience.date
    fill_in "Description", with: @experience.description
    fill_in "Enddate", with: @experience.endDate
    fill_in "Entreprise", with: @experience.entreprise
    fill_in "Link", with: @experience.link
    fill_in "Picture", with: @experience.picture
    fill_in "Title", with: @experience.title
    click_on "Create Experience"

    assert_text "Experience was successfully created"
    click_on "Back"
  end

  test "should update Experience" do
    visit experience_url(@experience)
    click_on "Edit this experience", match: :first

    fill_in "Date", with: @experience.date
    fill_in "Description", with: @experience.description
    fill_in "Enddate", with: @experience.endDate
    fill_in "Entreprise", with: @experience.entreprise
    fill_in "Link", with: @experience.link
    fill_in "Picture", with: @experience.picture
    fill_in "Title", with: @experience.title
    click_on "Update Experience"

    assert_text "Experience was successfully updated"
    click_on "Back"
  end

  test "should destroy Experience" do
    visit experience_url(@experience)
    click_on "Destroy this experience", match: :first

    assert_text "Experience was successfully destroyed"
  end
end
