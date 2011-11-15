#encoding: utf-8
require 'movie_searcher'
require 'observer'
class DirScanner 
  include Observable
  attr_accessor :path, :status, :count
  def initialize(path)
    @path = Dir.new(path)
    @status = 0
    @count = @path.count - 2
    @canceled = false
  end

  def scan
    notify('Ανάγνωση...')
    movies = []
    @path.each do |e|
      return nil  if @canceled
      unless e == '..' or e == '.'
        movies << MovieSearcher.find_by_download(e)
        @status += 1
        notify(e)
      end
    end
    return movies
  end

  def notify(path)
    changed
    notify_observers(@status, path)
  end

  def cancel
    puts 'CANCELLED!'
    @canceled = true
  end

end
