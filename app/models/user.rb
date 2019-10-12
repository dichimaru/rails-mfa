class User < ApplicationRecord
  authenticates_with_sorcery!
  acts_as_google_authenticated lookup_token: :salt, drift: 30, issuer: 'user'
  after_create {|record| record.set_google_secret }
end
