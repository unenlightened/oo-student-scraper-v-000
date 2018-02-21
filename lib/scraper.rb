require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    students = []

    doc.css(".student-card").each do |student|
       students << {
       :name => student.css(".student-name").text,
       :location => student.css(".student-location").text,
       :profile_url => student.css("a").attribute("href").value
       }
    end
    students
  end

  def self.scrape_profile_page(profile_url)  # :twitter, :linkedin, :github, :blog, :profile_quote, :bio
    doc = Nokogiri::HTML(open(profile_url))

    profile = {
    :twitter => doc.css(".social-icon-container a").attribute("href").value,
    # :linkedin => linkedin || nil,
    # :github => github,
    # :blog => blog,
    :profile_quote => doc.css(".profile-quote").text,
    :bio => doc.css(".description-holder p").text
    }

    binding.pry

  end
end
