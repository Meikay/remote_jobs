
#CLI Controller

 class RemoteJobs::CLI

    def start
      greet_user
      RemoteJobs::Scraper.full_stack_jobs
      menu
      choose_num
      alt_menu
      good_bye
    end

    def greet_user
      puts "Welcome to our top 100 Full Stack Remote Jobs"
      puts "Would you like to see our our list?"
      puts "If so, please type 'Yes'!"
    end

    def menu
        input = nil
        while input != 'exit'    
        input = gets.strip.downcase
        
        case input
        when "yes"  
          menu_helper
          #  display_jobs
          #  choose_num #puts out the description about the job the user chose
          #  alt_menu
        when "exit"
          good_bye
        else
          puts "Sorry! I didn't understand that input please enter a number or exit"
          menu
        end
      end
    end

    def display_jobs
      puts ""
      puts "---------- Top 100 Full Stack Jobs ----------"
      puts ""
        RemoteJobs::Jobs.all.each.with_index(1) do |job, index| #use a range
          puts "#{index}. #{job.name} - #{job.company} - #{job.url}"
      end
    end

    def choose_num
      puts "\nIf you would like to know more information about a job, choose a number from 1-100:"
        input = gets.strip
        until input.to_i.between?(1,100) || input == "exit"
          puts "Sorry! I didn't understand that, please enter a number or exit!"
          input = gets.strip
        end
        index = input.to_i - 1
        description = RemoteJobs::Scraper.add_description(RemoteJobs::Jobs.all[index]) #only do this if the job I picked does not have a description
        clean_description = description.gsub("{linebreak}", "\n")
        puts "#{clean_description}" #how to make it look pretty
    end 

    def alt_menu
      puts "Would you like to see another job description? Type 'D' "
      puts "Would you like to exit? Type 'E' "
      input = nil
      while input != 'exit'    
      input = gets.strip.downcase
      case input
      when "d"
        menu_helper
        # display_jobs
        # choose_num
        # alt_menu
      when "e"
        good_bye
      else
        puts "Sorry! I didn't understand that, please enter a number or exit."
        alt_menu  #recursion
      end
      end
    end

    def menu_helper
      display_jobs
      choose_num
      alt_menu
    end

    def good_bye
      puts "Thank you for checking our list of full stack jobs!"
      exit!
    end
 end


 
        # check job_object
        # Dont rescrape!
        # fix the logic!
        # think of jobs as a database
        
        # get the right object for the num
        # it knows the name and url
        # use object's url
