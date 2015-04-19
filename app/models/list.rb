class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :permission, inclusion: { in: %w(private open viewable), 
    message: "%{value} is not a valid permission"}

  def open?
    permission == 'open'
  end

  def viewable?
    permission == 'viewable'
  end

  def private?
    permission == 'private'
  end
end
