class Category < ActiveRecord::Base

  attr_accessor :name

  def initialize(name)
    super
  end

end
