# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
        #  :lockable,
        #  :timeoutable,
        #  :trackable,
        #  :omniauthable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  include DeviseTokenAuth::Concerns::User
end
