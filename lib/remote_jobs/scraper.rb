require 'pry'
class RemoteJobs::Scraper
    attr_accessor :name, :company, :language, :url

    def self.full_stack_jobs
      doc = Nokogiri::HTML(open("https://remoteok.io/remote-full-stack-jobs"))
        job_listings = doc.css("td.company.position.company_and_position") #td.company.position.company_and_position
          job_listings[1...101].each do |job_listing|
            job = RemoteJobs::Jobs.new
            job.name= job_listing.css('a.preventLink h2').text
            job.company= job_listing.css('a.companyLink h3').text
            #job.language= job_listing.css('a.no-border.tooltip h3').text   #do it in the second level use #split
            job.url= "https://remoteok.io" + job_listing.css('a')[0].attributes["href"].value
      
          end
    end

    def self.scrape_link(description) #job
      webpage = Nokogiri::HTML(open(description.url))
      jobs = webpage.css("td.company.position.company_and_position a.preventLink h2")
      jobs.each do |job_deets|
        description.jobs << job_deets.text
       
      end
    end












end

# job = RemoteJobs::Jobs.new
#             job.name= job_listing.css('a.preventLink h2').text
#             job.company= job_listing.css('a.companyLink h3').text
#             #job.language= job_listing.css('a.no-border.tooltip h3').text   #do it in the second level use #split
#             job.url= "https://remoteok.io" + job_listing.css('a')[0].attributes["href"].value
            




  # def self.full_stack_jobs  
  #   listing = []
  #    doc = Nokogiri::HTML(open("https://remoteok.io/remote-full-stack-jobs"))
  #    job_listings = doc.css("tr.job") #td.company.position.company_and_position
  #       job_listings.each do |job_listing|
  #         jobs = {}
  #         jobs[:name] = job_listing.css('a.preventLink h2').text, #lists all objects not just name,use .shift maybe iterate and extract the  object
  #         jobs[:company] = job_listing.css('a.companyLink h3').text,
  #         jobs[:language] = job_listing.css('td.tags').text,   
  #         jobs[:url] = "https://remoteok.io" + job_listing.css('a')[0].attributes["href"].value
  #         listing << jobs
  #       end
  #     listing  
  # end

  # def self.scrape_details(url)
  #   webpage = Nokogiri::HTML(open(url))
  #   deets = webpage.css("a.preventLink href")
  #     deets.each do |job_deets|
  #       url.deets << job_deets.text
  #     end
  # end
