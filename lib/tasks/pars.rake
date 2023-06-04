require 'nokogiri'
require 'open-uri'
require 'rake'

desc 'name clinic'
task nameClinic: :environment do
  texts = Nokogiri::HTML(URI.open('https://www.hospitalsafetygrade.org/all-hospitals')).css('#BlinkDBContent_849210 ul li a').map(&:text)
  clinics = Clinic.all
  i = 0
  texts.each do |text|
    if( i < clinics.size)
      clinics[i].name = text
      clinics[i].save
      i+=1
    end
  end
end