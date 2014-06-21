# == Schema Information
#
# Table name: genres
#
#  idgenres :integer          not null
#  genre    :string(511)      not null
#

module Imdb
  class Genre < ActiveRecord::Base
    self.table_name = 'genres'
    self.inheritance_column = 'ruby_type'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :idgenres, :genre
    end

  end
end
