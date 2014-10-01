require 'test_helper'

feature 'deleting a guide and its steps' do
  scenario 'delete a guide' do
    visit guides_path
    #save_and_open_page
    click_link 'Destroy'
    page.wont_have_content 'How to bake a pie'
  end

  scenario 'delete a step' do
    guides(:guide).steps << steps(:step1)

    visit guide_path(guides(:guide))
    click_link 'Destroy'
    page.wont_have_content 'Get pie stuff'
  end
end
