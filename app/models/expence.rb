class Expence < ApplicationRecord
    belongs_to :user
  
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :date, presence: true
    validates :category, presence: true
    validates :mode, presence: true
end
  