require 'pry'
#CLI Controller

 class RemoteJobs::CLI

     def start
      greet_user
      menu
      RemoteJobs::Scraper.full_stack_jobs
      print_jobs
      good_bye
    end

    def greet_user
      puts "Welcome to our top 100 Full Stack Remote Jobs"
      puts "Please type 'full stack' to see a list of full stack jobs"
    end

    def menu
        input = nil
        while input != 'exit'    
        input = gets.strip.downcase

        if input == "full stack"
          print_jobs
        # elsif input.to_i.between?(1, 100)
          choose_num #puts out the description about the job the user chose
        elsif input == "exit"
          good_bye
        else
          puts "Sorry! I didn't understand that input please enter a number or exit"
        end
      end
    end

    def print_jobs
      puts ""
      puts "---------- Top 100 Full Stack Jobs ----------"
      puts ""
      RemoteJobs::Scraper.full_stack_jobs
        RemoteJobs::Jobs.all.each.with_index(1) do |job, index| #use a range
          puts "#{index}. #{job.name} - #{job.company} - #{job.url}"
      end
    end

    def choose_num
      puts "\nchoose a number from 1-100 to learn more about a job's description:"
        input = gets.strip
        # max_val = RemoteJobs::Jobs.all.length
        # until input == "exit"
          if input.to_i.between?(1,100)
            # find particular job description
            # 2nd level scrape
            # list job and description
            # description = RemoteJobs::Jobs.all[input-1]
            # display_description(description)
          else
            puts "\nSorry! I didn't understand that input please enter a number or exit"
            choose_num  #recursion
          end
    end

    def scrape_description
      url = "https://remoteok.io/remote-full-stack-jobs"
      description = RemoteJobs::Scraper.scrape_link(url)
    end

    def display_description(description)
      
    end

    def alt_menu

    end

    def good_bye
      puts "Thank you for checking our list of full stack jobs!"
    end
 end


 

