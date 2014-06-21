# == Schema Information
#
# Table name: acted_in
#
#  idacted_in       :integer          not null, primary key
#  idmovies         :integer          not null
#  idseries         :integer
#  idactors         :integer          not null
#  character        :string(1023)
#  billing_position :integer
#

module Imdb
  class ActedIn < ActiveRecord::Base
    self.table_name = 'acted_in'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'idacted_in'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :idmovies, :idseries, :idactors, :character, :billing_position
    end

  end
end
