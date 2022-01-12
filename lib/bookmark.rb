require 'pg'

class Bookmark 

  def self.all
    # ['bookmark 1', 'bookmark 2', 'bookmark 3']
    connection = PG.connect(:dbname => 'bookmark_manager')
    result = connection.exec "SELECT * FROM bookmarks"
    result.map { |bookmark| bookmark['url'] }
  end 

  def self.create(url_link)
    connection = PG.connect(:dbname => 'bookmark_manager')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url_link}');")
  end  
end 

# we wanna feed the method the name of the directory

# def self.all(database_name)
#   # ['bookmark 1', 'bookmark 2', 'bookmark 3']
#   connection = PG.connect(:dbname => database_name, :user => 'Josh')
#   result = connection.exec "SELECT * FROM bookmarks"
#   result.map { |bookmark| bookmark['url'] }
# end 