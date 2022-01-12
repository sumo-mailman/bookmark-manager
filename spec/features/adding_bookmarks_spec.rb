feature 'Adding bookmarks' do
  scenario 'a new bookmark is added' do
      visit '/bookmarks' 
      click_button "Add link"
      fill_in "URL", with: "http://www.makersacademy.com"
      click_button "Submit"
      expect(page).to have_content "http://www.makersacademy.com"
  end
end