require 'pg'

class Bookmark 

  def self.all
    # ['bookmark 1', 'bookmark 2', 'bookmark 3']
    connection = PG.connect(:dbname => 'bookmark_manager', :user => 'Josh')
    result = connection.exec "SELECT * FROM bookmarks"
    result.map { |bookmark| bookmark['url'] }
  end 
end 

# we wanna feed the method the name of the directory

# def self.all(database_name)
#   # ['bookmark 1', 'bookmark 2', 'bookmark 3']
#   connection = PG.connect(:dbname => database_name, :user => 'Josh')
#   result = connection.exec "SELECT * FROM bookmarks"
#   result.map { |bookmark| bookmark['url'] }
# end 