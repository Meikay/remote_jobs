#what is this file doing?
#calling RemoteJobs::Jobs.today doesnt work neither does running ./bin/console
#check bin/remote_jobs for right to require

class RemoteJobs::Jobs
    attr_accessor :name, :company, :language, :url

  def self.today
    # Scrape remote_jobs and return list based on that data

          job_1 = self.new
          job_1.name = "JavaScript Developer"
          job_1.company = "Muse"
          job_1.language = "fullstack/React/Rails"
          job_1.url = "https://remoteok.io/remote-jobs/70746-remote-full-stack-web-developer-suse"

          job_2 = self.new
          job_2.name = "Full Stack Developer"
          job_2.company = "sulvo"
          job_2.language = "fullstack/React/Rails"
          job_2.url = "https://remoteok.io/remote-jobs/70634-remote-full-stack-developer-sulvo"

          [job_1, job_2]
  end
end
