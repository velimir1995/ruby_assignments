require "rot_cypher"
describe RotCypher do
  describe "#encrypt" do
    let(:rot5) {RotCypher.new(5)}
    let(:rot0) {RotCypher.new(0)}
    let(:rot26) {RotCypher.new(26)}
    let(:rot13) {RotCypher.new(13)}

    context "Encrypt with shift key 5" do
      it "messsage 'omg' return 'trl'" do
        message = "omg"
        expected = "trl"
        expect(rot5.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 0" do
      it "message 'c' return 'c'" do
        message = "c"
        expected = "c"
        expect(rot0.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt with shift key 26" do
      it "message 'Cool' return 'Cool'" do
        message = "Cool"
        expected = "Cool"
        expect(rot26.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt sentence with shift key 13" do
      it "message 'The quick ... the lazy dog' return 'Gur dhvpx ... gur ynml qbt'" do
        message = "The quick brown fox jumps over the lazy dog"
        expected = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt back sentence with shift key 13" do
      it "message 'Gur dhvpx ... gur ynml qbt' return 'The quick ... the lazy dog'" do
        message = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
        expected = "The quick brown fox jumps over the lazy dog"
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

    context "Encrypt sentence with special characters" do
      it "Does not change special characters" do
        message = "The quick brown fox jumps over the \"lazy\" dog"
        expected = "Gur dhvpx oebja sbk whzcf bire gur \"ynml\" qbt"
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

  end

end
