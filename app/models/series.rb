# == Schema Information
#
# Table name: series
#
#  idseries :integer          not null, primary key
#  idmovies :integer          not null
#  name     :string(1023)
#  season   :integer
#  number   :integer
#

class Series < ActiveRecord::Base
  self.table_name = 'series'
  self.inheritance_column = 'ruby_type'

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :idseries, :idmovies, :name, :season, :number
  end

end
