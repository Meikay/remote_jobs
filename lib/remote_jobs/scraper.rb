class RemoteJobs::Scraper

  def self.full_stack_jobs
    puts "********** scraping jobs"
    doc = Nokogiri::HTML(open("https://remoteok.io/remote-full-stack-jobs"))
    job_listings = doc.css("td.company.position.company_and_position")# td.company.position.company_and_position
    job_listings[0...100].each do |job_listing |
      name = job_listing.css('a.preventLink h2').text
      company = job_listing.css('a.companyLink h3').text
      url = "https://remoteok.io" + job_listing.css('a')[0].attributes["href"].value
    RemoteJobs::Jobs.new(name, company, url)
    end
  end
  
  def self.add_description(job_object)# job << add_description
    puts "************* scraping description"
    description_page = Nokogiri::HTML(open(job_object.url))
    job_object.description = description_page.css("div.description").text
  end
end