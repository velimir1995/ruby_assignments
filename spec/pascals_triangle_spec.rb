require "pascals_triangle"
describe PascalsTriangle do

  describe "#to_s" do
    let(:pastri4) {PascalsTriangle.new(4)}

    context "With initialized triangle" do
      it "return String" do
        expect(pastri4.to_s).to be_a(String)
      end
    end

    context "With initialized triangle to 4" do
      it "return 1\n1 1\n1 2 1\n1 3 3 1" do
        expected = "1\n1 1\n1 2 1\n1 3 3 1"
        expect(pastri4.to_s).to eq(expected)
      end
    end

  end

  describe "#to_a" do
    let(:pastri5) {PascalsTriangle.new(5)}

    context "With initialized triangle to 5" do
      it "return Array" do
        expect(pastri5.to_a).to be_a(Array)
      end
    end

    context "With initialized triangle to 5" do
      it "return [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]" do
        expected = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
        expect(pastri5.to_a).to eq(expected)
      end
    end

  end

end
