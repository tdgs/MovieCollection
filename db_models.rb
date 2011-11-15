# encoding: utf-8
require 'rubygems'
require 'data_mapper'

class DataMapper::Property
  
  accept_options :disp_name
  def disp_name
	options[:disp_name]  || nil
  end
  
  def disp_name=(name)
	options[:disp_name] = name
  end
  
end  

DataMapper::Logger.new($stdout, :debug)
DataBaseFileName = 'medical.db'
DataMapper::setup(:default, "sqlite:#{DataBaseFileName}")

require_relative 'db_models/movie'
require 'movie_searcher'
DataMapper.finalize
#DataMapper.auto_upgrade!




