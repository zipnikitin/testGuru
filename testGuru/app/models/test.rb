
class Test < ActiveRecord::Base 
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :tittle, presence: true, uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy_tests,    -> { level(0..1) }
  scope :medium_tests,  -> { level(2..4) }
  scope :hard_tests,    -> { level(5..Float::INFINITY) }

  scope :tests_named, ->(category_name) do
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
  end
  
  def self.show_tests_named(category_name)
    tests_named(category_name)
      .pluck(:title)
  end
end

