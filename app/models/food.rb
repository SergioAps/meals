class Food < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
  validates_numericality_of :grams, only_integer: true, allow_nil: true
  validate :portion_or_grams

  private

  def portion_or_grams
    return if portion.present? || grams.present?

    errors.add(:base, "Specify number of portions or grams")
  end
end
