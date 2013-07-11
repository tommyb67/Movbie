class Actor < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :movies

  def say_my_name
    "#{self.name} is a big movie star!"
  end
end
