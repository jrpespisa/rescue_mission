require 'rails_helper'

feature "Edit question" do
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

  scenario "user visits a question's page" do
    user
    question
    visit '/'
    click_link "Can't figure this stuff out, seriously cmon man this is silly."
    click_on "Edit Question"

    expect(page).to have_content "Edit Your Question"
    find_field('Title').value.should eq "Can't figure this stuff out, seriously cmon man this is silly."
    find_field('Description').value.should eq "Yeah, so this thing I tried is no longer working,
    what the heck... I mean seriously why the heck did they think this was
    a good idea like really man...suggestions?"
  end

  scenario "User edits form and submits edited question successfully"  do
    user
    question
    visit '/'
    click_link "Can't figure this stuff out, seriously cmon man this is silly."
    click_on "Edit Question"
    fill_in "Title", with: "A question title here is now it is here. Now it's long enough."
    fill_in "Description", with: "Yeah, so this thing I tried is no longer working,
    what the heck did they think this was going to teach me anyway!!!!!!!!!!!!!!!! really man...suggestions?"

    click_on "Submit"
    expect(page).to have_content "Question updated successfully!"
    expect(page).to have_content "A question title here is now it is here. Now it's long enough."
    expect(page).to have_content "Yeah, so this thing I tried is no longer working,
    what the heck did they think this was going to teach me anyway!!!!!!!!!!!!!!!! really man...suggestions?"
  end

  scenario "User edits form and submits edited question unsuccessfully" do
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
