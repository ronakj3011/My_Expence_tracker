class User < ApplicationRecord
  has_many :expences, dependent: :destroy
  validates :budget, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
