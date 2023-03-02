class Hotel < ApplicationRecord
  
    has_many :accodamations
    has_many :custmers

   
 validates :name,  presence: true
 validates :name, length: { minimum: 2 , maximum: 13}
 validates :address, length: { minimum: 2 , maximum: 15}
 validates :name, uniqueness: true
end
