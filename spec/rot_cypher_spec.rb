require "rot_cypher"
describe RotCypher do
    let(:rc) {RotCypher.new}

  context "Encrypt with shift key  5 with 'omg'" do
      it "returns 'trl'" do
        expect(rc.encrypt("omg",5)).to eq("trl")
      end
  end
  context "Encrypt with shift key  0 with 'c'" do
      it "returns 'c'" do
        expect(rc.encrypt("c",0)).to eq("c")
      end
  end
  context "Encrypt with shift key  26 with 'Cool'" do
      it "returns 'Cool'" do
        expect(rc.encrypt("Cool",26)).to eq("Cool")
      end
  end
  context "Encrypt with shift key  13 with 'The quick brown fox jumps over the lazy dog'" do
      it "returns 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
        expect(rc.encrypt("The quick brown fox jumps over the lazy dog",13)).to eq("Gur dhvpx oebja sbk whzcf bire gur ynml qbt")
      end
  end
  context "Encrypt with shift key  3 with 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
      it "returns 'The quick brown fox jumps over the lazy dog'" do
        expect(rc.encrypt("Gur dhvpx oebja sbk whzcf bire gur ynml qbt",13)).to eq("The quick brown fox jumps over the lazy dog")
      end
  end
end
