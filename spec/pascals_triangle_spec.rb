require "pascals_triangle"
describe PascalsTriangle do

  let(:pastri4) { PascalsTriangle.new(4) }
  let(:pastri1) { PascalsTriangle.new(1) }
  let(:pastri5) { PascalsTriangle.new(5) }

  describe "#to_s" do

    context do
      it "returns a String" do
        expect(pastri4.to_s).to be_a(String)
      end
    end

    context "With triangle initialized to 4" do
      it "returns a 4-row triangle" do
        expected = "1\n1 1\n1 2 1\n1 3 3 1"
        expect(pastri4.to_s).to eq(expected)
      end
    end

    context "With triangle initialized to 1" do
      it "returns a single row triangle" do
        expected = "1"
        expect(pastri1.to_s).to eq(expected)
      end
    end

    context "With triangle initialized to 5" do
      it "returns a five-row triangle" do
        expected = "1\n1 1\n1 2 1\n1 3 3 1\n1 4 6 4 1"
        expect(pastri5.to_s).to eq(expected)
      end
    end

  end

  describe "#to_a" do

    context do
      it "returns an Array" do
        expect(pastri5.to_a).to be_a(Array)
      end
    end

    context "With triangle initialized to 4" do
        it "returns a 4-row triangle" do
        expected = [[1],[1,1],[1,2,1],[1,3,3,1]]
        expect(pastri4.to_a).to eq(expected)
      end
    end

    context "With triangle initialized to 1" do
      it "returns a single row triangle" do
        expected = [[1]]
        expect(pastri1.to_a).to eq(expected)
      end
    end

    context "With triangle initialized to 5" do
      it "returns a 5-row triangle" do
        expected = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
        expect(pastri5.to_a).to eq(expected)
      end
    end

  end

end
