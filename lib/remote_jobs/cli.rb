require 'pry'
#CLI Controller

 class RemoteJobs::CLI

     def start
       greet_user
       RemoteJobs::Scraper.full_stack_jobs
       print_jobs
       good_bye
    end

    def greet_user 
        input = nil
        while input != 'exit'
        puts "Welcome to Full Stack Remote Jobs"    
        puts "Enter the number of the job you would like more information on" 
        puts "Or type list to see the list of Full Stack Remote Jobs again! To exit, type exit:"
        input = gets.strip.downcase

        if input == "full stack"
          RemoteJobs::Scraper.full_stack_jobs  #puts a numbered list of full stack jobs 
          print_jobs
          binding.pry
        #elsif input.to_i > 0 
            #puts out the details about the job the user chose
        elsif input == "exit"
          good_bye
        else
          puts "Sorry! I didn't understand that input please enter a number or exit"
          greet_user 
        end
      end
    end

    def print_jobs
      puts ""
      puts "---------- Full Stack Jobs ----------"
      puts ""
      RemoteJobs::Details.all.each.with_index(1) do |job, index| #use a range
        puts "#{index}. #{job.name} - #{job.company} - #{job.language} - #{job.url}"
       
      end
    end
 

     def good_bye
       puts "Thank you for checking our list of jobs!"
     end
 end


 


    # def jobs_list
    #   #get jobs(scrape)
    #   puts "Here are a list of jobs:"
    #   @jobs = RemoteJobs::Scraper.scrape_jobs
    #   @jobs.each.with_index(1) do |job, i|
    #      puts "#{i}. #{job.name}" #- #{job.company} - #{job.language}
    #   end
    # end

