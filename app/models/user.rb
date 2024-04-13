class User < ApplicationRecord
  #по мимо прочего, добавляет два виртуальных атрибута(которые не попадают в бд): password and password_confirmation
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

end
