class User < ApplicationRecord
        validates :username, presence: true,
                             uniqueness:{case_sensitive:false}, 
                             length: {minimum:3, maximum:25}
        VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i                   
        validates :email, presence: true,
                         uniqueness: {case_sensitive:false},
                          length: { maximum: 105 },
                          format: {with: VALID_EMAIL_REGEX}
        VALID_NUMBER_REGEX = /\d[0-9]\)*\z/                
        validates :phone, presence: true,
                        length: {minimum:10, maximum:15},
                        format: {with: VALID_NUMBER_REGEX}
                        
        has_secure_password
end