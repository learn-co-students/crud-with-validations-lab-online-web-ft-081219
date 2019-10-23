class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if record.released
            unless record.release_year.present? && record.release_year<=Time.now.year
                record.errors[:release_year] << "must be present and less than or equal to current year."
            end
        else
            if record.release_year.present?
                unless record.release_year <= Time.now.year
                    record.errors[:release_year] << "must be less than or equal to current year."
                end
            end
        end
    end
end