class Restaurant < ActiveRecord::Base
  has_many :genres, :through => :restaru
  has_many :types
end
