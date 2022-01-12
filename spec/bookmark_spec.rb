require 'bookmark'

describe Bookmark do
  describe '.all' do 
    it 'shows a list of all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('htttp://www.google.com');")  

      expect(Bookmark.all).to include 'http://www.makersacademy.com'
      expect(Bookmark.all).to include 'http://www.google.com'
      expect(Bookmark.all).to include 'http://www.destroyallsoftware.com'
    end 
  end 


  describe '.create' do
    it 'adds a new bookmark' do
      Bookmark.create("http://wwww.slack.com")
      expect(Bookmark.all).to include 'http://www.slack.com'
    end
  end
end 