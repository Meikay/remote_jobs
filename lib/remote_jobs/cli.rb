require 'pry'
#CLI Controller

class RemoteJobs::CLI
    def start
    #   jobs_list
      greet_user
      good_bye
    end

    # def jobs_list
    #   #get jobs(scrape)
    #   puts "Here are a list of jobs:"
    #   @jobs = RemoteJobs::Scraper.scrape_jobs
    #   @jobs.each.with_index(1) do |job, i|
    #      puts "#{i}. #{job.name}" #- #{job.company} - #{job.language}
    #   end
    # end


    def greet_user 
        input = nil
        while input != 'exit'
        puts "Welcome to Remote Jobs"
        puts "Type in the type of job you are looking for"    
        puts "Enter the number that you would like more information on" 
        puts "Or type list to see the list of jobs again! To exit, type exit:"
        input = gets.strip.downcase

        # if input.to_i > 0
        #     puts @jobs[input.to_i - 1]
        #     puts "#{i}. #{job.name}"

        case input
        when "full stack"
          puts "full stack"
        #   scrape_full_stack
        #   list_numbered_jobs
        #   choose_number
        #    url = "https://remoteok.io/remote-full-stack-jobs"
        #    jobs = RemoteJobs::Scraper.scrape_jobs(url) #list of full stack jobs scrape the full stack page
           
        when "front end"
          puts "front end"
        when "rails"
          puts "rails"
        when "exit"
          puts "Goodbye"
        else
          puts "Sorry! I didn't understand that input please enter a number or exit"
          greet_user 
        end
    end
end


    def good_bye
      puts "Thank you for checking our list of jobs!"
    end
end

