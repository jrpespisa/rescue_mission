require 'rails_helper'

feature "Post a new question" do

  scenario "user visits new question page" do
    visit '/'
    click_on "Submit Question"


    expect(page).to have_content "Ask New Question"
    expect(page).to have_content "Title"
    expect(page).to have_content "Description"
  end

  scenario "User fills form and submits new question successfully"  do
    visit '/'
    click_on "Submit Question"
    fill_in "User", with: 1
    fill_in "Title", with: "A question title here is now it is here."
    fill_in "Description", with: "Yeah, so this thing I tried is no longer working,
    what the heck... I mean seriously why the heck did they think this was
    a good idea like really man...suggestions?"

    click_on "Submit"
    expect(page).to have_content "New question submitted!"
    expect(page).to have_content "A question title here is now it is here."
    expect(page).to have_content "Yeah, so this thing I tried is no longer working,
    what the heck... I mean seriously why the heck did they think this was
    a good idea like really man...suggestions?"
  end

  scenario "User fills out form incorrectly" do
    visit '/'
    click_on "Submit Question"
    fill_in "User", with: 1
    fill_in "Title", with: "This title is too short"
    fill_in "Description", with: "This description is way too short"

    click_on "Submit"
    expect(page).to have_content "Please fill all forms correctly (title length >= 40, description length >= 150)"
  end
end
