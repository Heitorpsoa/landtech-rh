class Recruiter < ApplicationRecord
    validates :email, uniqueness: true
    has_many :jobs
    has_secure_password

    def to_builder
        Jbuilder.new do |recruiter|
          recruiter.(self, :name, :email)
        end
    end
end
