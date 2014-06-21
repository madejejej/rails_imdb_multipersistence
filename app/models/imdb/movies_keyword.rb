# == Schema Information
#
# Table name: movies_keywords
#
#  idmovies_keywords :integer          not null, primary key
#  idmovies          :integer          not null
#  idkeywords        :integer          not null
#  idseries          :integer
#

module Imdb
  class MoviesKeyword < ActiveRecord::Base
    self.table_name = 'movies_keywords'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'idmovies_keywords'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :idmovies, :idkeywords, :idseries
    end

  end
end
