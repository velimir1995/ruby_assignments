require "pascals_triangle"
describe PascalsTriangle do

  describe "#generate_triangle" do
    let(:pastri) {PascalsTriangle.new}

    context "When sent 7, triangle length" do
      it "return 7" do
        expect(pastri.generate_triangle(7).length).to eq(7)
      end
    end

    context "When sent 5,and try to acces row on index 6" do
      it "return nil" do
        expect(pastri.generate_triangle(5)[6]).to eq(nil)
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
