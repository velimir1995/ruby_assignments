require "rot_cypher"
describe RotCypher do
  describe "#encryption" do
    let(:rc) {RotCypher.new(5)}

    context "Encrypt with shift key 5 with 'omg'" do
      message = "omg"
      expected = "trl"
      it "returns '#{expected}'" do
        rc.shift_key = 5
        expect(rc.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 0 with 'c'" do
      message = "c"
      expected = "c"
      it "returns '#{expected}'" do
        rc.shift_key = 0
        expect(rc.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 26 with 'Cool'" do
      message = "Cool"
      expected = "Cool"
      it "returns '#{expected}'" do
        rc.shift_key = 26
        expect(rc.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 13 with 'The quick brown fox jumps over the lazy dog'" do
      message = "The quick brown fox jumps over the lazy dog"
      expected = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
      it "returns '#{expected}'" do
        rc.shift_key = 13
        expect(rc.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 13 with 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
      message = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
      expected = "The quick brown fox jumps over the lazy dog"
      it "returns '#{expected}'" do
        rc.shift_key = 13
        expect(rc.encrypt(message)).to eq(expected)
      end
    end
  end
end
