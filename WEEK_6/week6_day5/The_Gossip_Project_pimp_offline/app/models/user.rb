class User < ApplicationRecord
  attr_accessor :sign_up_code
  validates :sign_up_code,
    on: :create,
    presence: true,
    inclusion: { in: ["kaamelott"] }  
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
           has_many :gossips

#           mount_uploader :image, ImageUploader
end
