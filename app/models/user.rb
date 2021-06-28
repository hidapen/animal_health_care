class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :human_first_name,      presence: true
  validates :human_last_name,       presence: true
  validates :human_first_name_rubi, presence: true
  validates :human_last_name_rubi,  presence: true
  validates :pets_name,             presence: true
  validates :pets_name_rubi,        presence: true
  validates :pets_type,             presence: true
  validates :pets_age,              presence: true

end
