require 'rails_helper'

feature "Delete question" do
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

  scenario "user deletes a question from the question show page" do
    user
    question
    visit '/'
    click_link "Can't figure this stuff out, seriously cmon man this is silly."
    click_on "Delete Question"

    expect(page).to have_content "Questions"
    expect(page).to_not have_content "Can't figure this stuff out, seriously cmon man this is silly."
  end

  scenario "User deletes a question from the edit question page"  do
    user
    question
    visit '/'
    click_link "Can't figure this stuff out, seriously cmon man this is silly."
    click_on "Edit Question"
    click_on "Delete Question"

    expect(page).to have_content "Questions"
    expect(page).to_not have_content "Can't figure this stuff out, seriously cmon man this is silly."
  end

  scenario "All answers for deleted question are also deleted" do
    user
    question
    visit '/'
    click_link "Can't figure this stuff out, seriously cmon man this is silly."
    click_on "Edit Question"
    fill_in "Title", with: "Now it's not long enough."
    fill_in "Description", with: "Yeah, so this thing I tried is no longer working,
    what the heck did they think this was going to teach me anyway!!!!!!!!!!!!!!!! really man...suggestions?"

    click_on "Submit"
    expect(page).to have_content "Please fill out form properly!!!"
  end
end
