require 'test_helper'

feature 'updating a guide and its steps' do
  scenario 'update a guide' do
    visit edit_guide_path(guides(:guide))
    fill_in 'Title', with: 'How to bake a cake'
    click_button 'Save'
    page.must_have_content 'How to bake a cake'
    page.wont_have_content guides(:guide).title
  end

  scenario 'update steps of a guide' do
    guides(:guide).steps << steps(:step1)

    visit guide_path(guides(:guide))
    find("a[href='/guides/#{guides(:guide).id}/steps/#{steps(:step1).id}/edit']").click
    #save_and_open_page
    fill_in 'Action', with: 'Make the crust'
    click_button 'Update step'
    page.must_have_content 'Make the crust'
    page.wont_have_content steps(:step1).action
  end
end
