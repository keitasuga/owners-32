require 'mechanize'

class Scarping

  def self.plans_urls
    links = []
    agent = Mechanaize.new
    current_page = agent.get("https://owner-style.com/")
    elements = current_page.search('.plan_card_medium')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end
    links.each do |link|
      get_plans_information("https://owner-style.com/" + link)
    end
  end

  def self.get_plans_information(link)
    agent = Mechanaize.new
    page = agant.get(link)
    producer = page.at('.organization_name').inner_text
    area = page.at('.location_name').innder_text
    dead_line = page.at('.date').inner_text
    plan = Plan.new(producer: producer, area: area, dead_line: dead_line)
    plan.save
  end

end
