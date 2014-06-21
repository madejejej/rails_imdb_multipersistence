# == Schema Information
#
# Table name: aka_titles
#
#  idaka_titles :integer          not null, primary key
#  idmovies     :integer          not null
#  title        :string(1023)     not null
#  location     :string(63)
#  year         :integer
#

module Imdb
  class AkaTitle < ActiveRecord::Base
    self.table_name = 'aka_titles'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'idaka_titles'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :idmovies, :title, :location, :year
    end

  end
end
