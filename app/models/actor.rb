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

  has_many :acted_ins, class_name: "ActedIn", foreign_key: :idactors
  has_many :movies, through: :acted_ins
  has_many :series, through: :acted_ins

  neoidable do |c|
    c.field :fname
    c.field :mname
    c.field :lname
  end

  def id
    idactors
  end

  def findRecomendations
    query = <<-QUERY
    MATCH
    (actor:Actor {fname: "#{fname}", lname: "#{lname}"})-[:ACTED_IN]->()<-[:ACTED_IN]-(c),
        (c)-[:ACTED_IN]->()<-[:ACTED_IN]-(coc)
    WHERE coc <> actor  AND NOT((actor)-[:ACTED_IN]->()<-[:ACTED_IN]-(coc))
    RETURN DISTINCT coc.lname, coc.fname, count(coc)
    ORDER BY count(coc) DESC;
    QUERY
    return $neo.execute_query(query)
  end

  def moviesBeforeYear(year)
      movies.where("year < ?", year)
  end

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :idactors, :lname, :fname, :mname, :gender, :number
  end

end
