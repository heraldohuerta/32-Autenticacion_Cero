class User < ApplicationRecord
attr_accessor  :password_digest

  validates :name, presence: true, uniqueness:true
  validates :password, presence:true
  has_many :histories
end
