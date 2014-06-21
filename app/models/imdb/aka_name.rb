# == Schema Information
#
# Table name: aka_names
#
#  idaka_names :integer          not null, primary key
#  idactors    :integer          not null
#  name        :string(1023)     not null
#

module Imdb
  class AkaName < ActiveRecord::Base
    self.table_name = 'aka_names'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'idaka_names'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :idactors, :name
    end

  end
end
