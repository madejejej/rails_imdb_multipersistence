# == Schema Information
#
# Table name: movies_genres
#
#  idmovies_genres :integer          not null, primary key
#  idmovies        :integer          not null
#  idgenres        :integer          not null
#  idseries        :integer
#

class MoviesGenre < ActiveRecord::Base
  self.table_name = 'movies_genres'
  self.inheritance_column = 'ruby_type'
  self.primary_key = 'idmovies_genres'

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :idmovies, :idgenres, :idseries
  end

end
