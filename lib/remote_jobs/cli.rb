require 'pry'
#CLI Controller

 class RemoteJobs::CLI

     def start
      greet_user
      RemoteJobs::Scraper.full_stack_jobs
      menu
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
        RemoteJobs::Jobs.all.each.with_index(1) do |job, index| #use a range
          puts "#{index}. #{job.name} - #{job.company} - #{job.url}"
      end
    end

    def choose_num
      puts "\nchoose a number from 1-100 to learn more about a job's description:"
        input = gets.strip
        index = input.to_i - 1
        until input.to_i.between?(1,100) || input == "exit"
          puts "Sorry! I didn't understand that, please enter a number or exit!"
          input = gets.strip
        end
        # only do 53 if the job I picked doesnt have a description
        # check job_object
        # Dont rescrape!
        # fix the logic!
        # think of jobs as a database
        RemoteJobs::Scraper.scrape_link(RemoteJobs::Jobs.all[index])
        # get the right object for the num
        # it knows the name and url
        # use object's url 
        # if input != "exit"
        #   index =  input.to_i - 1
        #   menu
        # end
    end

     # find particular job description
            # 2nd level scrape
            # list job and description
            # description = RemoteJobs::Jobs.all[input-1]
            # display_description(description)

    # def scrape_description
    #   url = "https://remoteok.io/remote-full-stack-jobs"
    #   description = RemoteJobs::Scraper.scrape_link(url)
    # end

    # def display_description(description)
      
    # end

    def alt_menu
      puts "Would you like to see another job description? Type 'D' "
      puts "Would you like to exit? Type 'E' "
      input = gets.strip.downcase
      if input == "D"
        print_jobs
        choose_num
        scrape_description
        display_description
      elsif input == "E"
        good_bye
      else
        puts "Sorry! I didn't understand that, please enter a number or exit."
        alt_menu  #recursion
      end
    end

    def good_bye
      puts "Thank you for checking our list of full stack jobs!"
    end
 end


 

