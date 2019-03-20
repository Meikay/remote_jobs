
#CLI Controller

class RemoteJobs::CLI
  attr_accessor :sorted_jobs

  def start
    greet_user
    RemoteJobs::Scraper.full_stack_jobs
    sort_jobs_abc
    menu
    choose_num
    alt_menu
    good_bye
  end

  def greet_user
    puts "Welcome To Our Top 100 Full Stack Remote Jobs From Remoteok.io".colorize(:yellow)
    puts "Would you like to see our list?".colorize(:yellow)
    puts "If so, please type 'Yes' or 'Y'!".colorize(:yellow)
  end

  def menu
      input = nil
      while input != 'exit'    
      input = gets.strip.downcase
      if input == "yes" || input == "y"
        menu_helper
      elsif input == "exit" || input == "e"
        good_bye         
      else
        puts "Sorry! I didn't understand that input please enter a number or exit".colorize(:yellow)
        puts "Would you like to see our list?".colorize(:yellow)
        puts "If so, please type 'Yes' or 'Y'!".colorize(:yellow)
        menu 
      end
      end
  end

  def display_jobs
    puts ""
    puts "---------- Top 100 Full Stack Jobs ----------".colorize(:yellow)
    puts ""
    @sorted_jobs.each.with_index(1) do |job,index|
    #RemoteJobs::Jobs.all.each.with_index(1) do |job, index| #use a range
      puts "#{index}. #{job.name} - #{job.company} - #{job.url}".colorize(:red)
    end
  end

  def choose_num
    puts "\nIf you would like to know more information about a job, choose a number from 1-100:".colorize(:yellow)
    input = gets.strip
    until input.to_i.between?(1,RemoteJobs::Jobs.all.length)  
      if input == "e" || input == "exit" 
        good_bye
      else  
        puts "Sorry! I didn't understand that...".colorize(:yellow)
        choose_num
      end
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
    puts "Would you like to exit? Type 'E' or 'Exit' ".colorize(:yellow)
    input = nil
    while input != 'exit'    
    input = gets.strip.downcase
    case input
    when "d" || "description"
      menu_helper
    when "e" || "exit"
      good_bye
    else
      puts "Sorry, I didn't understand that...".colorize(:yellow)
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

  def sort_jobs_abc
    @sorted_jobs = RemoteJobs::Jobs.all.sort_by!{|job| job.name.downcase}
  end
end





      