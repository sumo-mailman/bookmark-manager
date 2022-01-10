feature 'viewing bookmarks' do
  scenario 'it shows bookmarks' do
    visit '/bookmarks'
    # click_on 'show bookmarks'
    expect(page).to have_content 'bookmark 1'
    expect(page).to have_content 'bookmark 2'
    expect(page).to have_content 'bookmark 3'
  end
end