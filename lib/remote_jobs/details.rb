class RemoteJobs::Details
     attr_accessor :name, :url, :description, :company, :language
     attr_reader :description
       @@all = []

       def initialize(name = nil, url = nil)
         @name = name
         @url =  "https://remoteok.io" + url.to_s 
         @items = []
         @@all << self #saving or remembering the object 
       end
        
       def self.all 
         @@all 
       end
      
end