require "pascals_triangle"
describe PascalsTriangle do

  describe "#to_s" do
    let(:pastri) {PascalsTriangle.new}
    let(:pastri4) {PascalsTriangle.new(4)}


    context "With initialized triangle" do
      it "return String" do
        expect(pastri4.to_s.instance_of?(String)).to eq(true)
      end
    end

    context "Without initialized triangle" do
      it "return nil" do
        expect(pastri.to_s).to eq(nil)
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
    let(:pastri) {PascalsTriangle.new}
    let(:pastri5) {PascalsTriangle.new(5)}

    context "With initialized triangle" do
      it "return Array" do
        expect(pastri5.to_a.instance_of?(Array)).to eq(true)
      end
    end

    context "Without initialized triangle" do
      it "return nil" do
        expect(pastri.to_a).to eq(nil)
      end
    end

    context "With initialized triangle to 5" do
      it "return [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]" do
        expected = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
        expect(pastri5.to_a).to eq(expected)
      end
    end

  end

  describe "#generate_triangle" do
    let(:pastri) {PascalsTriangle.new}
    let(:pastri7) {PascalsTriangle.new(7)}
    let(:pastri4) {PascalsTriangle.new(4)}

    context "When sent 7, length of result" do
      it "return 7" do
        expect(pastri.generate_triangle(7).length).to eq(7)
      end
    end

    context "When sent 5,and try to acces row on index 6 of results" do
      it "return nil" do
        expect(pastri.generate_triangle(5)[6]).to eq(nil)
      end
    end

    context "When sent 7 to pastri and then convert to_s" do
      it "return equal with pastri7.to_s" do
        pastri.generate_triangle(7)
        expect(pastri.to_s).to eq(pastri7.to_s)
      end
    end

    context "When sent 4 to pastri and then convert to_a" do
      it "return equal with pastri4.to_a" do
        pastri.generate_triangle(4)
        expect(pastri.to_a).to eq(pastri4.to_a)
      end
    end
  end

  describe "#get_row" do
    let(:pastri) {PascalsTriangle.new}

    context "When sent 8 " do
      it "return [1,7,21,35,35,21,7,1]" do
        expected = [1,7,21,35,35,21,7,1]
        expect(pastri.get_row(8)).to eq(expected)
      end
    end

    context "When sent 5 and try to access field at index 6" do
      it "return nil" do
        expect(pastri.get_row(5)[6]).to eq(nil)
      end
    end

    context "When sent 9, and check field at index 6" do
      it "return 28" do
        expect(pastri.get_row(9)[6]).to eq(28)
      end
    end
  end

  describe "#get_field" do
    let(:pastri) {PascalsTriangle.new}

    context "When sent 8 as a row index and 7 as a field index" do
      it "return 1" do
        expect(pastri.get_field(8,7)).to eq(1)
      end
    end

    context "When sent 5 as a row index and 7 as a field index" do
      it "return nil" do
        expect(pastri.get_field(5,7)).to eq(nil)
      end
    end
  end

  describe "#get_row_sum" do
    let(:pastri) {PascalsTriangle.new}

    context "When sent 8" do
      it "return 256" do
        expect(pastri.get_row_sum(8)).to eq(128)
      end
    end

    context "When sent 10" do
      it "return 1024" do
        expect(pastri.get_row_sum(10)).to eq(512)
      end
    end
  end

end
