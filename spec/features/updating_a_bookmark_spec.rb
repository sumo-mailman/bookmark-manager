feature 'Updating a bookmark' do 
  scenario 'it changes a bookmark' do 
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/bookmarks'
    expect(page). to have_link(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    first('.bookmark').click_button 'Edit'
    expect()



  end 
end 