# == Schema Information
#
# Table name: movies
#
#  idmovies :integer          not null
#  title    :string(1023)     not null
#  year     :integer
#  number   :integer
#  type     :integer
#  location :string(63)
#  language :string(63)
#

class Movie < ActiveRecord::Base
  self.table_name = 'movies'
  self.inheritance_column = 'ruby_type'

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :idmovies, :title, :year, :number, :type, :location, :language
  end

end
