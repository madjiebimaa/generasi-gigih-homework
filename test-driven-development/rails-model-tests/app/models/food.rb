class Food < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: true
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end

  def self.by_category(category_name)
    left_outer_joins(:category).where(category: { name: category_name })
  end
end
