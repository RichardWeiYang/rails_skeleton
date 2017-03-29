class Hobby < ApplicationRecord
  validates :title, presence: true

    has_many :hobbyships
    has_many :users, :through => :hobbyships
end
