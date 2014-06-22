# == Schema Information
#
# Table name: actors
#
#  idactors :integer          not null
#  lname    :string(1023)
#  fname    :string(1023)     not null
#  mname    :string(1023)
#  gender   :integer
#  number   :integer
#

class Actor < ActiveRecord::Base
  include Neoid::Node

  self.table_name = 'actors'
  self.inheritance_column = 'ruby_type'

  has_many :movies, through: :acted_ins
  has_many :serieses, through: :acted_ins

  neoidable do |c|
    c.field :fname
    c.field :mname
    c.field :lname
  end

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :idactors, :lname, :fname, :mname, :gender, :number
  end

end
