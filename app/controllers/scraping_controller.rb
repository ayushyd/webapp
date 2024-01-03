require 'open-uri'
require 'nokogiri'

class ScrapingController < ApplicationController

	def index
		@sections = Section.all
	end



	def scrape
	urls = ['https://www.bbc.com/',
	       'https://www.bbc.com/news',
	       'https://www.bbc.com/sport',
	       'https://www.bbc.com/future/earth',
	       'https://www.bbc.com/reel',
	       'https://www.bbc.com/worklife',
	       'https://www.bbc.com/travel',
	       'https://www.bbc.com/culture',
	       'https://www.bbc.com/future',
	       'https://www.bbc.co.uk/schedules/p00fzl9m',
	       'https://www.bbc.com/weather',
	       'https://www.bbc.co.uk/sounds'
	   ]

	urls.each do |link|

    html = URI.open(link)
    doc = Nokogiri::HTML(html)

    
    sections = doc.css('nav ul li a')

    sections.each do |section|
      
      section_name = section.text.strip
      section_link = section['href']
       Section.where(name: section_name).first_or_create(url: link + section_link)
    end
    end

    redirect_to root_path, notice: 'Scraping complete! Sections saved to the database.'
  end
end
