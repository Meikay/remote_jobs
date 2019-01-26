class RemoteJobs::Scraper
    attr_accessor :name, :company, :language, :url

  def self.scrape_jobs
    # Scrape remote_jobs and return list based on that data
    webpage = Nokogiri::HTML(open("https://remoteok.io/remote-full-stack-jobs"))
    array_of_jobs = webpage.css("td.company.position.company_and_position")
    
    array_of_jobs.map do |job|
        webpage = job.css("a.preventLink h2")
        url = job.css("a.preventLink")['href']
        puts url
    end
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
    name = doc.search("td.company position company_and_position h2").text
    binding.pry
  end

end

