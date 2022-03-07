require 'rails_helper'

RSpec.describe Book do
  xit 'exists', :vcr do

    weather_data = current_weather: {:datetime=>"09:48, March  7, -0700",
   :sunrise=>"06:24, March  7, -0700",
   :sunset=>"17:58, March  7, -0700",
   :temp=>23.32,
   :feels_like=>23.32,
   :humidity=>64,
   :uvi=>2.61,
   :visibility=>10000,
   :conditions=>"snow",
   :icon=>"13d"},

    book_data =
    {:numFound=>657,
     :docs=>
        [{
          :title=>"Denver, Co",
          :isbn=>["9780762507849", "0762507845"],
          :publisher=>["Universal Map Enterprises"]
        }]}
    location = "Denver,CO"

    book = Book.new(weather_data, book_data, location)


  end
end
