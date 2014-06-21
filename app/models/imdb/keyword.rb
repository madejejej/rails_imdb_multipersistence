# == Schema Information
#
# Table name: keywords
#
#  idkeywords :integer          not null
#  keyword    :string(255)      not null
#

module Imdb
  class Keyword < ActiveRecord::Base
    self.table_name = 'keywords'
    self.inheritance_column = 'ruby_type'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :idkeywords, :keyword
    end

  end
end
