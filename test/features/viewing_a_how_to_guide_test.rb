require 'test_helper'

feature 'viewing a how to guide' do
  scenario 'site visitor can see all the steps in a guide' do
    visit guides_path
    click_link 'Show'
    page.must_have_content guides(:guide).steps.first
  end
end
