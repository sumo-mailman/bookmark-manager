feature 'viewing bookmarks' do
  scenario 'it shows bookmarks' do
    visit '/bookmarks'
    # click_on 'show bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end