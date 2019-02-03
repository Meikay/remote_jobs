# model that makes job objects
class RemoteJobs::Jobs
     attr_accessor :description
     attr_reader :name, :company, :url
       @@all = []

       def initialize(name, company, url)  
        @name = name
        @company = company
        @url = url
        @@all << self #saving or remembering the object 
       end
        
       def self.all 
         @@all 
       end
end