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
        puts "Please type 'full stack' to see a list of full stack jobs"  
        input = gets.strip.downcase

        if input == "full stack"
          print_jobs
        elsif input.to_i > 0 
          choose_num
            #puts out the details about the job the user chose
        elsif input == "exit"
          good_bye
        else
          puts "Sorry! I didn't understand that input please enter a number or exit"
          
        end
      end
    end

    def print_jobs
      puts ""
      puts "---------- Full Stack Jobs ----------"
      puts ""
      RemoteJobs::Scraper.full_stack_jobs
        RemoteJobs::Jobs.all.each.with_index(1) do |job, index| #use a range
          puts "#{index}. #{job.name} - #{job.company} - #{job.url}"
      end
    end

    def choose_num
      puts "\nchoose a number to learn more about a job's description:"
        input = gets.strip.to_i
        max_val = RemoteJobs::Jobs.all.length
        if input.between?(1,max_val)
          description = RemoteJobs::Jobs.all[input-1]
          display_description(description)
        else
          puts "\nSorry! I didn't understand that input please enter a number or exit"
          print_jobs   #recursion
          choose_num
        end
    end

    def display_description(description)

    end
 

    def good_bye
      puts "Thank you for checking our list of jobs!"
    end
 end


 

