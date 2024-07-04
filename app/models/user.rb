# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         #  :lockable,
         :timeoutable,
         #  :trackable,
         #  :omniauthable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  include DeviseTokenAuth::Concerns::User
end
