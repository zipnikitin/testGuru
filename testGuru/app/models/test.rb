
<<<<<<< Updated upstream
class Test < ActiveRecord::Base 
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.tests_named(category_name)
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
=======
class Test < ActiveRecord::Base
  def self.tests_named(category_name)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category_name }).order(type: :desc).pluck(:tittles)
>>>>>>> Stashed changes
  end
end

