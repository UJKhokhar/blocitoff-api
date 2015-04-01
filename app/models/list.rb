class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :permission, inclusion: { in: %w(private open viewable), 
    message: "%{value} is not a valid permission"}
end
