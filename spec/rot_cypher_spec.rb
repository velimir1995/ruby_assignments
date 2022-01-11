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
    context "Rot26 with 'cool'" do
        it "returns 'cool'" do
            expect(rc.rot26("cool")).to eq("cool")
        end
    end
    context "Rot13 with 'the quick brown fox jumps over the lazy dog'" do
        it "returns 'gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
            expect(rc.rot13("the quick brown fox jumps over the lazy dog")).to eq("gur dhvpx oebja sbk whzcf bire gur ynml qbt")
        end
    end
    context "Rot13 with 'gur dhvpx oebja sbk whzcf bire gur ynml qbt" do
        it "returns 'the quick brown fox jumps over the lazy dog'" do
            expect(rc.rot13("gur dhvpx oebja sbk whzcf bire gur ynml qbt")).to eq("the quick brown fox jumps over the lazy dog")
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
    context "Universal root 26 with 'cool'" do
        it "returns 'cool'" do
            expect(rc.universal("cool",26)).to eq("cool")
        end
    end
    context "Universal root 13 with 'the quick brown fox jumps over the lazy dog'" do
        it "returns 'gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
            expect(rc.universal("the quick brown fox jumps over the lazy dog",13)).to eq("gur dhvpx oebja sbk whzcf bire gur ynml qbt")
        end
    end
    context "Universal root 3 with 'gur dhvpx oebja sbk whzcf bire gur ynml qbt" do
        it "returns 'the quick brown fox jumps over the lazy dog'" do
            expect(rc.universal("gur dhvpx oebja sbk whzcf bire gur ynml qbt",13)).to eq("the quick brown fox jumps over the lazy dog")
        end
    end
#    it("should give back gur dhvpx oebja sbk whzcf bire gur ynml qbt") do
#        rc.rot13("the quick brown fox jumps over the lazy dog").should == "gur dhvpx oebja sbk whzcf bire gur ynml qbt"
#    end
#    it("should return: omg =trl ") do
#        rc.rot5("omg").should == "trl"
#    end    
end