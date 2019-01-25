class RemoteJobs::Jobs
    attr_accessor :name, :company, :language, :url

  def self.today
    puts "1. JavaScript Developer - Muse - fullstack/React/Rails
          2. Rails Developer - SUSE - ruby/JavaScript"

          job_1 = self.new
          job_1.name = "JavaScript Developer"
          job_1.company = "Muse"
          job_1.language = "fullstack/React/Rails"
          job_1.url = "https://remoteok.io/remote-jobs/70746-remote-full-stack-web-developer-suse"

  end
end
