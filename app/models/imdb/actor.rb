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

module Imdb
  class Actor < ActiveRecord::Base
    self.table_name = 'actors'
    self.inheritance_column = 'ruby_type'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :idactors, :lname, :fname, :mname, :gender, :number
    end

  end
end
