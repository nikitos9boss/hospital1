require 'csv'

desc 'ParsingCSV'
task csv: :environment do
  csv_data = CSV.read(File.join(Rails.root, 'hospitals.csv'))
  clinics = Clinic.all
  i = 0
  csv_data.each do |row|
    if( i < clinics.size and i != 0)
      city = row[1]
      type = row[3]
      rating = row[5]
      clinics[i-1].city = city.to_s
      clinics[i-1].typeClinic = type.to_s
      clinics[i-1].ratingMortality = rating.to_s
      clinics[i-1].save
    end
    i+=1
  end

end