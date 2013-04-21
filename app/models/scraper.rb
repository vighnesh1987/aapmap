class Scraper
  URL = "http://www.aamaadmiparty.org/donate/Donation_List.aspx"
  NUM_PER_PAGE = 50
  NUM_COLS = 8
  attr_accessor :agent, :page, :count

  def initialize
    @agent ||= Mechanize.new
    @page = @agent.get(self.class::URL)
    @count = 1
  end

  def execute
    begin
      while(true)
        donations = self.donations
        existing_tids = Donation.where(transaction_id: donations.map(&:transaction_id)).pluck(:transaction_id)
        donations.reject {|donation| 
          donation.transaction_id.in? existing_tids
        }.each {|donation|
          donation.save
        }
        puts "On page##{@count} : total yet - #{Donation.count}"
        self.fetch_next
      end
      true
    rescue
      false
    end
  end

  def fetch_next
    @count += 1
    self.class.extra_form_fields(@count).each do |field|
      self.form.fields << field
    end
    @page = self.form.submit
  end

  def fetch_page_number num
    @count = num
    self.class.extra_form_fields(@count).each do |field|
      self.form.fields << field
    end
    @page = self.form.submit
  end


  def form
    @page.forms.first
  end

  def donation_info number
    begin
      name_el = @page.search("#MainContent_grdInnerData_txtVolunteerName_#{number}").first
      row = name_el.parent.parent
      all_data_el = row.children
      all_data_el.map {|el|
        el.text.strip
      }[0...NUM_COLS]
    rescue
      []
    end
  end

  def donations
    NUM_PER_PAGE.times.map {|num|
      Donation.parse(self.donation_info num)
    }
  end

  def self.extra_form_fields page_number
    {
      "__EVENTTARGET" => "ctl00$MainContent$grdInnerData",
      "__EVENTARGUMENT" => "Page$#{page_number}"
    }.map do |name,value|
      field = Mechanize::Form::Hidden.new name: name, value: value
      field.name = name
      field.value = value
      field.type = "hidden"
      field
    end
  end

end
