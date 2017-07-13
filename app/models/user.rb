class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :name, presence: true, uniqueness:{case_sensitive: false}
  validates :password, presence: true, length:{minimum: 6}, allow_nil: true
  validates_with EmailValidator
end
