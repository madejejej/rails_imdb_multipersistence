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

class ActedIn < ActiveRecord::Base
  include Neoid::Relationship

  self.table_name = 'acted_in'
  self.inheritance_column = 'ruby_type'
  self.primary_key = 'idacted_in'

  belongs_to :actor
  belongs_to :movie
  belongs_to :series


  neoidable do |c|
    c.relationship start_node: :actor, end_node: :movie, type: :acted_in
    c.relationship start_node: :actor, end_node: :series, type: :acted_in
  end

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :idmovies, :idseries, :idactors, :character, :billing_position
  end

end
