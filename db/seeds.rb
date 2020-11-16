# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require "open-uri"

x = CSV.read('/home/ldwee/sites/spapatrimoine/patrimoine.csv')
table = CSV.parse(File.read('/home/ldwee/sites/spapatrimoine/patrimoine.csv'), headers: true)

# libelle / illustrations / localisation / inscription / categorie / notice / etat / endangered / status / ipic

table.each do |row|
  p 'New row'
  next if Patrimoine.find_by(ipic: row['fiches_nr'])

  patrimoine = Patrimoine.new(
    libelle: row['libéllé(s)'],
    localisation: row['localisation'].sub("Adresse principale : ", ''),
    inscription: row['inscription'],
    categorie: row['catégorie(s)'],
    notice: row['notice'],
    etat: row['état'],
    ipic: row['fiches_nr']
  )

  images = row['illustration(s)']
  images = images[3...-1]
  images = images[0...-2]
  images = images.gsub('___', ' ')
  images = images.split(' ')

  images.each_with_index do |image, index|
    file = URI.open(image)
    patrimoine.images.attach(io: file, filename: "#{row['fiches_nr']} - #{index + 1}.jpg", content_type: 'image/jpg')
  end

  patrimoine.contributor = Contributor.find(1)
  patrimoine.status = 'acceptée'

  if patrimoine.save!
    geo = Geocoder.search(patrimoine.localisation)
    patrimoine.update(latitude: nil, longitude: nil) if (geo.length > 0 && geo.first.country_code != 'be')
    p "Patrimoine saved - #{row['fiches_nr']} (#{patrimoine.longitude} / #{patrimoine.latitude})"
  else
    p "Failed to save"
  end
end


