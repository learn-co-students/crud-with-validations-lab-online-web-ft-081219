class Song <ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, :if => :released?

    def released?
        true if self.released
    end 
end 