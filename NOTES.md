
My application will scrape the remoteok.io website and will return a list of jobs that contain the Job Title, Company Name, and Salary if it is provided. The user will use a series of prompts to get that information the screen.


a. I will be scraping Remoteok.io
b. Return a list of remote full-stack/react/ruby jobs that tells me the salary and job title. 
c. Classes of my project will be: Salary class, JobTitle class, Company class, Scraper class.
d. The flow of displaying the data would be:

	1.The CLI will output “Hi, what type of jobs are you looking for?”
	2.The USER will type “remote jobs”
	3.The CLI will output “What type of remote jobs?”
	4.The USER will type “full-stack/react/ruby jobs”
	5.The CLI will output a list of those type of jobs along with the required languages and name of the company.
e. The data will be displayed by finding the <td> tag  which is the entire card. The <h2> tag to list job title and then <h3> for the company name. Then find the <p> tag for the salary. I would use .text to go a level deep.

#Output should look like:

1. JavaScript Developer - Muse - fullstack/React/Rails
2. Rails Developer - SUSE - ruby/JavaScript


Enter the number that you would like more information on or type 'exit':

=> 2

#2nd level Deep

Job Description

Our Product

At this position you will work on the Open Build Service (OBS). A massive Ruby on Rails/Perl collaboration platform to maintain, build and distribute software. It helps SUSE Engineering, our partners and community developers to ship software for a wide range of operating systems and hardware architectures. The OBS makes it easy to harness the power of the open source development model by providing all the collaborative workflows needed.



