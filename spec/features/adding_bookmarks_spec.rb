feature 'Adding bookmarks' do
  scenario 'a new bookmark is added' do
      visit '/bookmarks/create'
      fill_in "URL", with: "http://www.test.com"
      fill_in "title", with: "Test Webpage Title"
      click_button "Submit"
      
      expect(page).to have_link('Test Webpage Title', href: "http://www.test.com")
  end
end