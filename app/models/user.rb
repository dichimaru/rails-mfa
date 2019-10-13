class User < ApplicationRecord
  authenticates_with_sorcery!
  acts_as_google_authenticated lookup_token: :salt, drift: 30, issuer: 'rails mfa sample'
  after_create {|record| record.set_google_secret }

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
end
