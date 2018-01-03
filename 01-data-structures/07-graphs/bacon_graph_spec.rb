include RSpec

require_relative 'bacon_graph'
require_relative 'node'

RSpec.describe Graph, type: Class do

    let(:line) { Line.new }
    let(:graph) { Graph.new }
    let(:kevin_bacon) { Node.new("Kevin Bacon") }

    let(:lori_singer)  { Node.new("Lori Singer") }
    let(:john_lithgow)  { Node.new("John Lithgow") }
    let(:dianne_west)  { Node.new("Dianne West") }
    let(:chris_penn)  { Node.new("Chris Penn") }
    let(:sara_jessica_parker)  { Node.new("Sara Jessica Parker") }
    let(:sean_penn)  { Node.new("Sean Penn") }
    let(:tim_robbins)  { Node.new("Tim Robbins") }
    let(:marcia_gay_harden)  { Node.new("Marcia Gay Harden") }
    let(:laurence_fishburne)  { Node.new("Laurence Fishburne") }
    let(:emmy_rossum)  { Node.new("Emmy Rossum") }
    let(:jude_law)  { Node.new("Jude Law") }
    let(:anthony_hopkins)  { Node.new("Anthony Hopkins") }
    let(:kate_winslet)  { Node.new("Kate Winslet") }
    let(:adrien_brody)  { Node.new("Adrien Brody") }
    let(:jeff_goldblum)  { Node.new("Jeff Goldblum") }
    let(:will_smith)  { Node.new("Will Smith") }
    let(:jake_gyllenhaal)  { Node.new("Jake Gyllenhaal") }
    let(:dennis_quaid)  { Node.new("Dennis Quaid") }
    let(:natalie_portman)  { Node.new("Natalie Portman") }
    let(:tobey_maguire)  { Node.new("Tobey Maguire") }
    let(:fake)  { Node.new("Fake") }
  
    let(:film_hash) { Hash.new }

    before do
        film_hash["Footloose"] = [kevin_bacon, lori_singer, john_lithgow, dianne_west, chris_penn, sara_jessica_parker]
        film_hash["Mystic River"] = [kevin_bacon, laurence_fishburne, sean_penn, tim_robbins, marcia_gay_harden, emmy_rossum]
        film_hash["All the King's Men"] = [sean_penn, jude_law, anthony_hopkins, kate_winslet]
        film_hash["The Grand Budapest Hotel"] = [jude_law, adrien_brody, jeff_goldblum]
        film_hash["Independence Day"] = [jeff_goldblum, will_smith]
        film_hash["The Day After Tomorrow"] = [emmy_rossum, jake_gyllenhaal, dennis_quaid]
        film_hash["Brother"] = [jake_gyllenhaal, natalie_portman, tobey_maguire]
    
        kevin_bacon.set_films(film_hash)
        lori_singer.set_films(film_hash)
        john_lithgow.set_films(film_hash)
        dianne_west.set_films(film_hash)
        chris_penn.set_films(film_hash)
        sara_jessica_parker.set_films(film_hash)
        laurence_fishburne.set_films(film_hash)
        sean_penn.set_films(film_hash)
        tim_robbins.set_films(film_hash)
        marcia_gay_harden.set_films(film_hash)
        emmy_rossum.set_films(film_hash)
        jude_law.set_films(film_hash)
        anthony_hopkins.set_films(film_hash)
        kate_winslet.set_films(film_hash)
        adrien_brody.set_films(film_hash)
        jeff_goldblum.set_films(film_hash)
        will_smith.set_films(film_hash)
        jake_gyllenhaal.set_films(film_hash)
        dennis_quaid.set_films(film_hash)
        natalie_portman.set_films(film_hash)
        tobey_maguire.set_films(film_hash)
        fake.set_films(film_hash)
    end

    describe "successfully finds matches" do
        it "finds Sean Penn" do
          find_bacon_sean_penn = ["Mystic River"]
          expect(graph.find_kevin_bacon(sean_penn)).to eq(find_bacon_sean_penn)
        end
    
        it "finds Natalie Portman" do
          find_bacon_natalie_portman = ["Brother", "The Day After Tomorrow", "Mystic River"]
          expect(graph.find_kevin_bacon(natalie_portman)).to eq(find_bacon_natalie_portman)
        end
    
        it "finds Sara jessica Parker" do
          find_bacon_sara_jessica_parker = ["Footloose"]
          expect(graph.find_kevin_bacon(sara_jessica_parker)).to eq(find_bacon_sara_jessica_parker)
        end

        it "finds Will Smith" do
            find_bacon_will_smith = ["Independence Day", "The Grand Budapest Hotel", "All the King's Men", "Mystic River"]
            expect(graph.find_kevin_bacon(will_smith)).to eq(find_bacon_will_smith)
        end
    end
    
    describe "successfully finds no match" do
        it "doesn't find a fake node match" do
          expected_output = "Not Connected to Kevin Bacon"
          find_bacon_fake_node = graph.find_kevin_bacon(fake)
          expect(find_bacon_fake_node).to eq(expected_output)
        end
    end

end