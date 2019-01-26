

class RemoteJobs::Jobs
    attr_accessor :name, :company, :language, :url

  def self.today
    # Scrape remote_jobs and return list based on that data
    self.scrape_jobs
  end

  def scrape_jobs 
    jobs = []

    jobs << self.scrape_remoteok

    #Go to remoteok, find the jobs
    #extract the properties
    #instantiate a job
    
    jobs
  end

  def scrape_remoteok
    doc = Nokogiri::HTML(open("https://remoteok.io/remote-full-stack-jobs")) 
    binding.pry
  end

end
