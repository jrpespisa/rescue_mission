require 'rails_helper'

feature "Questions are displayed on the index page" do
  let(:user) do
    User.create(
    username: "John"
    )
  end
  let(:question) do
    Question.create(
    title: "Can't figure this stuff out, seriously cmon man this is silly.",
    description: "Yeah, so this thing I tried is no longer working,
    what the heck... I mean seriously why the heck did they think this was
    a good idea like really man...suggestions?",
    user_id: user.id
    )
  end
  
  scenario "Questions have a title" do
    user
    question
    visit '/'

    expect(page).to have_content "Can't figure this stuff out"
  end

  scenario "Questions are links to their show page" do
    user
    question
    visit '/'

    click_link "Can't figure this stuff out, seriously cmon man this is silly."
    expect(page).to have_content "Yeah, so this thing I tried is no longer"
  end
end
