# spec/roth_cypher_spec.rb
require "rot_cypher"
describe Rot_cypher do
    let(:rc){Rot_cypher.new}
    context "Rot5 with 'omg'" do
        it "returns 'trl'" do
            expect(rc.rot5("omg")).to eq("trl")
        end
    end
    context "Rot0 with 'c'" do
        it "returns 'c'" do
            expect(rc.rot0("c")).to eq("c")
        end
    end 
    context "Rot26 with 'Cool'" do
        it "returns 'Cool'" do
            expect(rc.rot26("Cool")).to eq("Cool")
        end
    end
    context "Rot13 with 'The quick brown fox jumps over the lazy dog'" do
        it "returns 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
            expect(rc.rot13("The quick brown fox jumps over the lazy dog")).to eq("Gur dhvpx oebja sbk whzcf bire gur ynml qbt")
        end
    end
    context "Rot13 with 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt" do
        it "returns 'The quick brown fox jumps over the lazy dog'" do
            expect(rc.rot13("Gur dhvpx oebja sbk whzcf bire gur ynml qbt")).to eq("The quick brown fox jumps over the lazy dog")
        end
    end
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
#    it("should give back gur dhvpx oebja sbk whzcf bire gur ynml qbt") do
#        rc.rot13("the quick brown fox jumps over the lazy dog").should == "gur dhvpx oebja sbk whzcf bire gur ynml qbt"
#    end
#    it("should return: omg =trl ") do
#        rc.rot5("omg").should == "trl"
#    end    
end