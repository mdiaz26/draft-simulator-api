VA = Opponent.create(name: "Hua", team_name: "Virginia", penalties: 0, strategy: "4")
GK = Opponent.create(name: "Dustin", team_name: "Great Kills", penalties: 0, strategy: "4")
LIC = Opponent.create(name: "Warren", team_name: "LIC", penalties: 0, strategy: "6")
NE = Opponent.create(name: "Wankyu", team_name: "New England", penalties: 0, strategy: "7")
MARS = Opponent.create(name: "John", team_name: "Mars", penalties: 0, strategy: "3")
HAR = Opponent.create(name: "Diaz", team_name: "Harlem", penalties: 0, strategy: "7")
FLU = Opponent.create(name: "Chu", team_name: "Flushing", penalties: 0, strategy: "3")
CR = Opponent.create(name: "Ken", team_name: "Capital Region", penalties: 0, strategy: "5")
OAK = Opponent.create(name: "Doho", team_name: "Oakland", penalties: 0, strategy: "3")
YON = Opponent.create(name: "Jae", team_name: "Yonkers", penalties: 0, strategy: "8")

# RankingPlayer.delete_all
Ranking.delete_all
# FranchisePlayer.delete_all
# Franchise.delete_all
# Draft.delete_all


rankings1 = Ranking.create(name: "Default Rankings")



roster_config1 = RosterConfig.create(
    name: "HFFL Rosters",
    qb: 1,
    rb: 2,
    wr: 3,
    te: 1,
    rb_wr: 1,
    wr_te: 1,
    superflex: 1,
    def: 1,
    k: 1,
    bench: 7,
    flex: 0
)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'fantasy-players-csv.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# PLAYER CREATION
csv.each do |row|
    p = Player.new
    p.name = row['Player']
    p.position = row['Position']
    p.pro_team = row['NFL Team']
    p.save
end

# DEFAULT RANKING_PLAYER CREATION
csv.each do |row|
    rp = RankingPlayer.new
    rp.ranking = rankings1
    rp.player = Player.find_by(name: row['Player'])
    rp.value = row['Value']
    rp.tier = row['Tier']
    rp.save
end