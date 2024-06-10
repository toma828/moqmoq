class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name, presence: true, length: { maximum: 50, allow_blank: true }
  validates :password, presence: true, confirmation: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end