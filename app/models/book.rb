class Book < ApplicationRecord

belongs_to :user

# validates :introduction, presence: true

validates :body, length: { in: 1..200 }

end
