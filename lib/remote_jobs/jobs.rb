# model that makes job objects
class RemoteJobs::Jobs
     attr_accessor :name, :url, :description, :company
       @@all = []

       def initialize(name = nil, url = nil)
         @name = name
         @url =  "https://remoteok.io" + url.to_s 
         @@all << self #saving or remembering the object 
       end
        
       def self.all 
         @@all 
       end
      
end