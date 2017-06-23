class Hobby < ApplicationRecord
  validates :title, presence: true

    has_many :hobbyships
    has_many :users, :through => :hobbyships

    mount_uploader :image, ImageUploader
end
