# frozen_string_literal: true

require 'pg'
require 'bookmarks'
require 'database_helpers'
describe Bookmarks do
  context 'Checks if class instances are being created to check if a class exists' do
    it 'creates an instance of the given class' do
      bookmark = Bookmarks.new(id: 22, title: 'google', url: 'www.google.com')
      expect(bookmark).to be_an_instance_of(Bookmarks)
    end
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmark = Bookmarks.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmarks.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmarks.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmarks.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmarks.create(url: 'http://www.example.org', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.example.org'
    end
  end
end
