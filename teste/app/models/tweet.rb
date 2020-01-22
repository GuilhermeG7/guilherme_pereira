class Tweet < ActiveRecord::Base
  belongs_to :zombie

  validates :status, length: { minimum: 3 }, presence: true
end

