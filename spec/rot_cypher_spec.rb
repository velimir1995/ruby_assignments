require "rot_cypher"
describe RotCypher do

  describe "#encrypt" do
    let(:rot5) {RotCypher.new(5)}
    let(:rot0) {RotCypher.new(0)}
    let(:rot26) {RotCypher.new(26)}
    let(:rot13) {RotCypher.new(13)}

    context "When send 'omg' with shift key 5" do
      it "should return 'trl'" do
        message = "omg"
        expected = "trl"
        expect(rot5.encrypt(message)).to eq(expected)
      end
    end

    context "When send 'c' while on shift key 0" do
      it "should return 'c'" do
        message = "c"
        expected = "c"
        expect(rot0.encrypt(message)).to eq(expected)
      end
    end

    context "When send 'Cool' while on shift key 26" do
      it "should return 'Cool'" do
        message = "Cool"
        expected = "Cool"
        expect(rot26.encrypt(message)).to eq(expected)
      end
    end

    context "When send 'The quick brown fox jumps over the lazy dog' while on shift key 13" do
      it "should return 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt'" do
        message = "The quick brown fox jumps over the lazy dog"
        expected = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

    context "When send 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt' while on shift key 13" do
      it "should return 'The quick brown fox jumps over the lazy dog'" do
        message = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
        expected = "The quick brown fox jumps over the lazy dog"
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

    context "When send text with special characters" do
      it "should not change them" do
        message = "The quick brown fox jumps over the \"lazy\" dog"
        expected = "Gur dhvpx oebja sbk whzcf bire gur \"ynml\" qbt"
        expect(rot13.encrypt(message)).to eq(expected)
      end
    end

  end

end
