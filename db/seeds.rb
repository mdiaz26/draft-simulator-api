# VA = Franchise.create(name: "Virginia", budget: 300)
# GK = Franchise.create(name: "Great Kills", budget: 300)
# LIC = Franchise.create(name: "LIC", budget: 300)
# NE = Franchise.create(name: "New England", budget: 300)
# MARS = Franchise.create(name: "Mars", budget: 300)
# HAR = Franchise.create(name: "Harlem", budget: 300)
# FLU = Franchise.create(name: "Flushing", budget: 300)
# CR = Franchise.create(name: "Capital Region", budget: 300)
# OAK = Franchise.create(name: "Oakland", budget: 300)
# YON = Franchise.create(name: "Yonkers", budget: 300)

# rankings1 = Ranking.create(name: "Default Rankings")

roster_config1 = RosterConfig.create(
    
)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'fantasy-players-csv.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

## PLAYER CREATION
# csv.each do |row|
#     p = Player.new
#     p.name = row['Player']
#     p.position = row['Position']
#     p.pro_team = row['NFL Team']
#     p.save
# end

## DEFAULT RANKING_PLAYER CREATION
# csv.each do |row|
#     rp = RankingPlayer.new
#     rp.ranking = rankings1
#     rp.player = Player.find_by(name: row['Player'])
#     rp.value = row['Value']
#     rp.tier = row['Tier']
#     rp.save
# end