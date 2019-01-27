require 'pry'
#CLI Controller

class RemoteJobs::CLI
    def start
      jobs_list
      greet_user
      good_bye
    end

    def jobs_list
      #get jobs(scrape)
      puts "Here are a list of jobs:"
      @jobs = RemoteJobs::Scraper.scrape_jobs
      @jobs.each.with_index(1) do |job, i|
         puts "#{i}. #{job.name}" #- #{job.company} - #{job.language}
      end
    end


    def greet_user 
        input = nil
        while input != 'exit'
        puts "Hi, Enter the number that you would like more information on or type list to see the list of jobs again! To exit, type exit:"
        input = gets.strip.downcase

        if input.to_i > 0
            puts @jobs[input.to_i - 1]
            puts "#{i}. #{job.name}"
        elsif input == "list"
            puts jobs_list 
        else
            puts "Not sure what you would like to do, please type: list, exit or a number!"
            greet_user
        end
      end
    end

    def good_bye
      puts "Thank you for checking our list of jobs!"
    end
end

