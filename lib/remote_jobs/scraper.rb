require 'pry'
class RemoteJobs::Scraper
    attr_accessor :name, :company, :language, :url

     doc = Nokogiri::HTML(open("https://remoteok.io/remote-full-stack-jobs"))
     job_listings = doc.css("td.company.position.company_and_position")
        job_listings.map do |job_listing|
          name = job_listing.css('a.preventLink h2').text, #lists all objects not just name,use .shift maybe iterate and extract the  object
          company = job_listing.css('a.companyLink h3').text,
          language = job_listing.css('div.tag.tag-full-stack h3').text,  #broken
          url = "https://remoteok.io" + job_listing.css('a')[0].attributes["href"].value
          
          binding.pry
        end


      # How I want my data to look like
      # job_listings = parsed_page.css('td.company.position.company_and_position')
      # job_listings.each do |job_listing|
      #   job = {
      #     name: job_listing.css('a.preventLink h2').text,
      #     company: job_listing.css('a.companyLink h3').text,
      #     language: job_listing.css('div.tag tag-full-stack h3').text,
      #     url: "https://remoteok.io" + job_listing.css('a')[0].attributes["href"].value
    


  # def self.scrape_details(url)
  #   # Scrape remote_jobs and return list based on that data
  #   webpage = Nokogiri::HTML(open(url))
  #   array_of_jobs = webpage.css("td.company.position.company_and_position")
  #      title = array_of_jobs.css("a.preventLink h2")
    
  #     array_of_jobs.map do |job|
  #       #RemoteJobs::Details.new(job.text) # lists the non-full stack dev jobs
  #          title = job.css("a.preventLink h2").text # lists full stack dev jobs but I need the title only
  #           url = job.css("a.preventLink")[0]['href']
  #           puts url
  #     end
  # end

  # def scrape_jobs(details)
  #    webpage = Nokogiri::HTML(open(details.url))
  #    jobs = webpage.css("a.preventLink h2")
  #    jobs.each do |job_link|
  #    details.jobs << job_link.text 
  #   end
  # end
end

