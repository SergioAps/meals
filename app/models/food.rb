class Food < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
  validates_numericality_of :grams, only_integer: true, allow_nil: true
end
