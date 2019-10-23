class TitleValidator < ActiveModel::Validator
    def validate(record)
        #invalid if name not present or if there is another song with this name with the same artist and year 
        #valid if name present AND
        holder = Song.all.select{|s|s.title==record.title && (s.artist_name==record.artist_name && s.release_year==record.release_year)}
        unless record.title.present? && holder.empty?
            record.errors[:title] << "Title must be present and unique among this artist's songs this year!"
        end
    end
end