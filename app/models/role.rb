class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map(&:actor)
    end

    def locations
        self.auditions.map(&:location)
    end

    def lead
        lead = self.auditions.where(hired: true).order(:updated_at).first
        lead.nil? ? 'no actor has been hired for this role' : lead
    end

    def understudy
        lead = self.auditions.where(hired: true).order(:updated_at).second
        lead.nil? ? 'no actor has been hired for this role' : lead
    end
end
