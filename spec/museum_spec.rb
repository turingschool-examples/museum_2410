require './lib/museum'
require './lib/exhibit'
require './lib/patron'

RSpec.describe Museum do
  it 'exist and had attributes' do

    denvermns = Museum.new("Denver Museum of Nature and Science")

    expect(denvermns).to be_a(Museum)

    expect(denvermns.name).to eq("Denver Museum of Nature and Science")

    expect(denvermns.exhibits). to eq([])
  end

  it 'can add exhibits' do

    denvermns = Museum.new("Denver Museum of Nature and Science")

    gems_and_minls = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sead Scrolls, cost: 10"})

    denvermns.add_exhibit(gems_and_minls)
    denvermns.add_exhibit(dead_sea_scrolls)

    expect(denvermns.exhibits).to ew ([gems_and_minls, dead_sea_scrolls])
  end

  it 'cam recommend exhibits based on patron interests' do
    denvermns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minls = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sead Scrolls", cost: 10})
    cinemax = Exhibit.new({name: "Cinemax", cost: 15})

    denvermns.add_exhibit(gems_and_minls)
    denvermns.add_exhibit(dead_sea_scrolls)
    denvermns.add_exhibit(cinemax)

    patron_1 = Patron.new("Scarlett", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    patron_2 = Patron.new("Solaine", 20)
    patron_2.add_interest("Cinemax")

    expect(denvermns.recommend_exhibits(patron_1)).to eq([gems_and_minls, dead_sea_scrolls])
    expect(denvermns.recommend_exhibits(patron_2)).to eq([cinemax])
  end
end