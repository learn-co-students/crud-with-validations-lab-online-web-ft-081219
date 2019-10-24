class Song < ApplicationRecord
    validate :already_released
    validates :title, presence: true
    validates :release_year, presence: true, if: :released?
    validates_numericality_of :release_year, less_than_or_equal_to: Time.now.year, allow_nil: true

    def already_released
        if !Song.where(title: title, release_year: release_year, artist_name: artist_name).empty?
            errors.add(:title, "already been release this year")
        end
    end
end
