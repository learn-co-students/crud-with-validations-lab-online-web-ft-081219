require "pry"
class Song < ApplicationRecord
    
    validates :title, presence: true
    validates :title, uniqueness: true

    validates :release_year, presence: true ,inclusion:{in: 0..2019}, :if => :released?
  
    def released?
     true  if self.released
   end
end
