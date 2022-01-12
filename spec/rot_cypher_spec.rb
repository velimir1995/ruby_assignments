require "rot_cypher"
describe RotCypher do
    let(:rc) {RotCypher.new}

    context "Universal root 5 with 'omg'" do
        it "returns 'trl'" do
            expect(rc.universal("omg",5)).to eq("trl")
        end
    end
    context "Universal root 0 with 'c'" do
        it "returns 'c'" do
            expect(rc.universal("c",0)).to eq("c")
        end
    end 
    context "Universal root 26 with 'Cool'" do
        it "returns 'Cool'" do
            expect(rc.universal("Cool",26)).to eq("Cool")
        end
    end
    context "Universal root 13 with 'The quick brown fox jumps over the lazy dog'" do
        it "returns 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
            expect(rc.universal("The quick brown fox jumps over the lazy dog",13)).to eq("Gur dhvpx oebja sbk whzcf bire gur ynml qbt")
        end
    end
    context "Universal root 3 with 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
        it "returns 'The quick brown fox jumps over the lazy dog'" do
            expect(rc.universal("Gur dhvpx oebja sbk whzcf bire gur ynml qbt",13)).to eq("The quick brown fox jumps over the lazy dog")
        end
    end
end
