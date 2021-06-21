
class Test < ActiveRecord::Base
  def self.tests_named(category_name)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category_name }).order(type: :desc).pluck(:tittles)
  end
end

