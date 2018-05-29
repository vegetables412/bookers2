class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :books
attachment :profile_image
# attachment :introduction
validates :name, presence: true
validates :name,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 2, maximum: 20 }
validates :introduction, length: { in: 0..50 }
end
