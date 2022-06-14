class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  
  with_options presence: true do
    validates :password,   format: { with: VALID_PASSWORD_REGEX, message: "は、半角英数字混合で入力してください" }, allow_blank: true
    validates :nickname
    validates :profile
  end
end
