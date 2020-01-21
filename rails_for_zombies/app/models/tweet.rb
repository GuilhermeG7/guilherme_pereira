class Tweet < ActiveRecord::Base
  belongs_to :Zombie

  validates :status, presence: true, length: { minimum: 3 }

end