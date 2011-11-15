require_relative 'imdb'
require_relative 'ui_aware'


class Movie
  include ImdbEntity
  include UiAware
end

