require 'bookmark'

describe Bookmark do
  describe '.all' do 
    it 'shows a list of all bookmarks' do 
      expect(Bookmark.all).to eq ['bookmark 1', 'bookmark 2', 'bookmark 3']
    end 
  end 
end