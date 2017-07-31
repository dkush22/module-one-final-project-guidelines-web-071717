class Person < ActiveRecord::Base

  has_many :person_todos
  has_many :todos, through: :person_todos

  def initialize(name:)
    super
    @name = name
  end

end
