class Project < ActiveRecord::Base

    validates_format_of :secret, :with => /\A([a-z0-9]){16}\Z/
    validates_uniqueness_of :secret 

    after_initialize :auto_secret

    def auto_secret
      if !self.secret
        # create valid secret that is guaranteed to not exist yet
        allowedChars=('a'..'z').to_a + ('0'..'9').to_a
        begin
          newsecret = (1..16).map{ allowedChars[SecureRandom.random_number(allowedChars.length)] }.join
        end until !Project.find_by_secret(newsecret)
        self.secret = newsecret 
      end
    end


end
