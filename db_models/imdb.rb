# encoding: utf-8
require 'rubygems'
require 'data_mapper' 

module ImdbEntity
  
  # a map between our methods and the ones in MovieSearcher
  # if nil, then there is no mapping
  MethodMap = {:id => nil,
               :title => :title,
               :release_date => :release_date,
               :tagline => :tagline,
               :imdb_rating => :rating,
               :imdb_id => :imdb_id,
               :poster_url => :poster_url
  }

              

  def self.included(base)
    base.class_eval do
      include DataMapper::Resource
      property :id, DataMapper::Property::Serial, :disp_name => 'Κωδικός'
      property :title, DataMapper::Property::String, :disp_name => 'Τίτλος'
      property :release_date, DataMapper::Property::Date, :disp_name =>'Ημ. Κυκλοφορίας'
      property :imdb_rating, DataMapper::Property::Decimal, :disp_name => 'Βαθμ. IMDB'
      property :user_rating, DataMapper::Property::Decimal, :disp_name => 'Βαθμ. Χρήστη'
      property :tagline, DataMapper::Property::Text, :disp_name => 'Tagline'
      property :plot, DataMapper::Property::Text, :disp_name => 'Υπόθεση'
      property :imdb_id, DataMapper::Property::String, :disp_name => 'Κωδ. IMDB', :key => true
      property :poster_url, DataMapper::Property::String
    end
  end

  def to_s
    full_name
  end

  def update_from_imdb(info)
    MethodMap.each do |self_method, movie_method|
      puts self_method
      self.send(self_method.to_s + '=', info.send(movie_method)) unless movie_method.nil?
    end
  end

  def update_from_imdb!(info)
    self.update_from_imdb(info)
    self.save!
  end

  def self.from_imdb(info)
    Movie.new.update_from_imdb(info)
  end
end
