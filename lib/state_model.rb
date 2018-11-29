class State < ActiveRecord::Base

  # attr_accessor :temp, :city, :state

  validates :temp, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
