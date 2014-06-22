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
  include Neoid::Node

  self.table_name = 'movies'
  self.inheritance_column = 'ruby_type'

  has_many :actors, through: :acted_ins

  neoidable do |c|
    c.field :title
  end

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :idmovies, :title, :year, :number, :type, :location, :language
  end

end
