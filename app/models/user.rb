class User < ActiveRecord::Base
  has_many :microposts
  validates :name, length: { maximum: 30 }, presence: true
  validates :email, length: { maximum: 30 }, presence: true
end
