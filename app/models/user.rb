class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  validates :first_name, :last_name, :email, :password_confirmation, presence: true
  validates :password, confirmation: true
end
