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
    query = "MATCH
    (keanu:Actor {fname:" + fname +", lname:" + lname + "})-[:ACTED_IN]->()<-[:ACTED_IN]-(c),
        (c)-[:ACTED_IN]->()<-[:ACTED_IN]-(coc)
    WHERE coc <> keanu  AND NOT((keanu)-[:ACTED_IN]->()<-[:ACTED_IN]-(coc))
    RETURN coc.name, count(coc)
    ORDER BY count(coc) DESC;"
    return @neo.execute_query(query)
  end

  def moviesBeforeYear(year)
      return ActedIn.select("count(*)").join(:actors, :movies).where("actors.fname :fname and actors.lname = :lane and  movies.year" < year, {fname: fname, lname: lname})
  end

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :idactors, :lname, :fname, :mname, :gender, :number
  end

end
