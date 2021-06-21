
class Test < ActiveRecord::Base
  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.tests_named(category_name)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category_name }).order(type: :desc).pluck(:tittles)
  end
end

