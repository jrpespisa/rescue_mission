require 'rails_helper'

feature "Post a new answer" do
  let(:user) do
    User.create(
    username: "John"
    )
  end
  let(:question) do
    Question.create(
    title: "Can't figure this stuff out",
    description: "Yeah, so this thing I tried is no longer working,
    what the heck... I mean seriously why the heck did they think this was
    a good idea like really man...suggestions?",
    user_id: user.id
    )
  end
  scenario "user visits question's page" do
    question
    visit '/'
    click_link "Can't figure this stuff out"
    fill_in "Description", with: "This is seriously the weirdest question."
    fill_in "User", with: 1
    click_on "Submit Answer"

    expect(page).to have_content "This is seriously the weirdest question."
  end
end
