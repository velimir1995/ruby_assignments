require "rot_cypher"
describe RotCypher do
  let(:rc) {RotCypher.new}

  context "Encrypt with shift key 5 with 'omg'" do
    actual = "omg"
    expected = "trl"
    it "returns '#{expected}'" do
      expect(rc.encrypt(actual,5)).to eq(expected)
    end
  end

  context "Encrypt with shift key 0 with 'c'" do
    actual = "c"
    expected = "c"
    it "returns '#{expected}'" do
      expect(rc.encrypt(actual,0)).to eq(expected)
    end
  end

  context "Encrypt with shift key 26 with 'Cool'" do
    actual = "Cool"
    expected = "Cool"
    it "returns '#{expected}'" do
        expect(rc.encrypt(expected,26)).to eq(expected)
      end
  end

  context "Encrypt with shift key 13 with 'The quick brown fox jumps over the lazy dog'" do
    actual = "The quick brown fox jumps over the lazy dog"
    expected = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
    it "returns '#{expected}'" do
        expect(rc.encrypt(actual,13)).to eq(expected)
      end
  end

  context "Encrypt with shift key 13 with 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
    actual = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
    expected = "The quick brown fox jumps over the lazy dog"
    it "returns '#{expected}'" do
        expect(rc.encrypt(actual,13)).to eq(expected)
      end
  end
end
