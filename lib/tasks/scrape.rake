task :scrape => :environment do |t, args|
  puts Scraper.new.execute
end
