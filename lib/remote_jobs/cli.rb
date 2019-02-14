
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
    puts "Welcome To Our Top 100 Full Stack Remote Jobs From Remoteok.io".colorize(:yellow)
    puts "Would you like to see our list?".colorize(:yellow)
    puts "If so, please type 'Yes'!".colorize(:yellow)
  end

  def menu
      input = nil
      while input != 'exit'    
      input = gets.strip.downcase
      case input
      when "yes"  
        menu_helper
      when "exit"
        good_bye
      else
        puts "Sorry! I didn't understand that input please enter a number or exit".colorize(:yellow)
        menu
      end
    end
  end

  def display_jobs
    puts ""
    puts "---------- Top 100 Full Stack Jobs ----------".colorize(:yellow)
    puts ""
    RemoteJobs::Jobs.all.each.with_index(1) do |job, index| #use a range
        puts "#{index}. #{job.name} - #{job.company} - #{job.url}".colorize(:red)
    end
  end

  def choose_num
    puts "\nIf you would like to know more information about a job, choose a number from 1-100:".colorize(:yellow)
      input = gets.strip
      until input.to_i.between?(1,100) || input == "exit"
        puts "Sorry! I didn't understand that, please enter a number or exit!".colorize(:yellow)
        input = gets.strip
      end
      index = input.to_i - 1
      jobs = RemoteJobs::Jobs.all
      if jobs[index].description == nil  #if job object does not have a description
        RemoteJobs::Scraper.add_description(RemoteJobs::Jobs.all[index]) #only do this if the job I picked does not have a description
      end
      clean_description = jobs[index].description.gsub("{linebreak}", "\n")
      puts "#{clean_description}".colorize(:blue) 
      alt_menu
  end 
  

  def alt_menu
    puts "Would you like to see another job description? Type 'D' ".colorize(:yellow)
    puts "Would you like to exit? Type 'E' ".colorize(:yellow)
    input = nil
    while input != 'exit'    
    input = gets.strip.downcase
    case input
    when "d"
      menu_helper
    when "e"
      good_bye
    else
      puts "Sorry! I didn't understand that, please enter a number or exit.".colorize(:yellow)
      alt_menu  
    end
  end
  end

  def menu_helper
    display_jobs
    choose_num
    alt_menu
  end

  def good_bye
    puts "Thank you for checking our list of full stack jobs!".colorize(:yellow)
    exit!
  end
end



      