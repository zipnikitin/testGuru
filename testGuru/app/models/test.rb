
class Test < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  def self.tests_named(category_name)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category_name }).order(type: :desc).pluck(:tittles)
  end
end

