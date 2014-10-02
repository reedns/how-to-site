require 'test_helper'

feature 'creating a guide' do
  scenario 'site vistors can create a new guide' do
    visit new_guide_path
    fill_in 'Title', with: 'How to turn on a computer'
    click_button 'Save'
    page.must_have_content 'How to turn on a computer'
  end

  scenario 'add steps to the guide' do
    visit new_guide_path
    fill_in 'Title', with: 'How to turn on a computer'
    click_button 'Save'

    fill_in 'Action', with: 'Press power button.'
    click_button 'Add step'
    page.must_have_content 'Press power button'
  end
end
