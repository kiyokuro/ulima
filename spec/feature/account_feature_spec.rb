require 'rails_helper'

feature 'Usecase: Account', js: true do
  background do
  end

  scenario do
    visit '/'
    click_on 'アカウント作成'
    # page.save_screenshot('screenshot.jpg')
    fill_in 'user_name', with: 'kurosawa'
    fill_in 'user_email', with: 'kurosawa@gmail.com'
    save_and_open_page
  end
end
