class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :tickets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   # User Photo Validation
  validates_integrity_of  :photo
  validates_processing_of :photo

  private
    def photo_size_validation
      errors[:photo] << "should be less than 1MB" if photo.size > 1.megabytes
    end
end
