require_relative '../lib/db_model_widget'
require_relative 'ui_files/movie_widget_ui'

class MovieWidget < Qt::Widget
  include DataBaseModelWidget
  Attrs = [:imdb_rating, :custom_rating, :release_date, :tagline, :poster_url]
  def initialize(parent = nil)
    super(parent = nil)
  end

  def setup_ui(movie)
    @ui = Ui::MovieWidget.setup_ui(self)
    self.item = movie
  end

  def attributes
    self.class.Attrs
  end
end
