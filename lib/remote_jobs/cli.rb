#CLI Controller

class RemoteJobs::CLI
    def start
      #jobs_list
      greet_user
      good_bye
    end

    def jobs_list
      #get jobs(scrape)
      @jobs = RemoteJobs::Jobs.today
    end


    def greet_user
        input = nil
        while input != 'exit'
        puts "Hi, Enter the number that you would like more information on or type list to see the list of jobs again! To exit, type exit:"
        input = gets.strip.downcase
        case input
        when "1"
            puts "More information on job 1..."
        when "2"
            puts "more information on job 2..."
        when "list"
            jobs_list
        else
            puts "Not sure what you would like to do, please type: list, exit or a number!"
        end
      end
    end

    def good_bye
      puts "Thank you for checking our list of jobs!"
    end
end

