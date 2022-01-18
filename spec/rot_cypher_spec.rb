require "rot_cypher"
describe RotCypher do
  describe "#encryption" do
    let(:rot5) {RotCypher.new(5)}
    let(:rot0) {RotCypher.new(0)}
    let(:rot26) {RotCypher.new(26)}
    let(:rot13) {RotCypher.new(13)}

    context "Encrypt with shift key 5 with 'omg'" do
      message = "omg"
      expected = "trl"
      it "returns '#{expected}'" do
        expect(rot5.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 0 with 'c'" do
      message = "c"
      expected = "c"
      it "returns '#{expected}'" do
        expect(rot0.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 26 with 'Cool'" do
      message = "Cool"
      expected = "Cool"
      it "returns '#{expected}'" do
        expect(rot26.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 13 with 'The quick brown fox jumps over the lazy dog'" do
      message = "The quick brown fox jumps over the lazy dog"
      expected = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
      it "returns '#{expected}'" do
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 13 with 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
      message = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
      expected = "The quick brown fox jumps over the lazy dog"
      it "returns '#{expected}'" do
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 13 with 'The quick brown fox jumps over the \"lazy\" dog'" do
      message = "The quick brown fox jumps over the \"lazy\" dog"
      expected = "Gur dhvpx oebja sbk whzcf bire gur \"ynml\" qbt"
      it "returns '#{expected}'" do
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 13 with 'The quick brown fox jumps over the lazy dog!!" do
      message = "The quick brown fox jumps over the lazy dog!!"
      expected = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt!!"
      it "returns '#{expected}'" do
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

  end

end
