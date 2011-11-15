# encoding: utf-8
require_relative './basic_model'
class MovieModel < BasicModel

  def initialize(parent = nil, collection = nil)
    super(parent, collection || Movie.all)
    @columnNames = [
      [:title, 'Τίτλος'],
      [:imdb_rating, 'Βαθμ. IMDB']
    ]
  end
end
