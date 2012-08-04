# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_many :microposts
  # has_secure_password
  before_save { |user| user.email = email.downcase}
  validates :name, presence: true, length: { maximum: 50 }
  # validates :password, presence: true, length: { minimum: 6 }
  # validates :password_confirmation, presence: true
  
  
  
end
