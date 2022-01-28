require "pascals_triangle"
describe PascalsTriangle do

  describe "#encrypt" do
    let(:pastri4) {PascalsTriangle.new(4)}
    let(:pastri7) {PascalsTriangle.new(7)}

    context "When created 7 rows pascal triangle has 7 rows" do
      it "return 7" do
        expected = 7
        expect(pastri7.get_number_of_rows).to eq(expected)
      end
    end

    context "When use 4 rows pascal triangle and ask for row at index 4" do
      it "return nil" do
        message = 4
        expected = nil
        expect(pastri4.get_row(message)).to eq(expected)
      end
    end

    context "When use 4 rows pascal triangle and ask for row at index 3" do
      it "return [1, 3, 3, 1]" do
        message = 3
        expected = [1,3,3,1]
        expect(pastri4.get_row(message)).to eq(expected)
      end
    end

    context "When use 4 rows pascal triangle and ask for field at row index 3 with field index 2" do
      it "return 3" do
        message1 = 3
        message2 = 2
        expected = 3
        expect(pastri4.get_field_by_indexes(message1,message2)).to eq(expected)
      end
    end

    context "When use 7 rows pascal triangle and ask for field at row index 6 with field index 4" do
      it "return 15" do
        message1 = 6
        message2 = 4
        expected = 15
        expect(pastri7.get_field_by_indexes(message1,message2)).to eq(expected)
      end
    end

    context "When use 7 rows pascal triangle and ask for field at row index 7 with field index 2" do
      it "return nil" do
        message1 = 7
        message2 = 2
        expected = nil
        expect(pastri7.get_field_by_indexes(message1,message2)).to eq(expected)
      end
    end

    context "When use 4 rows pascal triangle and ask for field at row index 2 with field index 4" do
      it "return nil" do
        message1 = 2
        message2 = 4
        expected = nil
        expect(pastri7.get_field_by_indexes(message1,message2)).to eq(expected)
      end
    end

    context "When use 7 rows pascal triangle and ask for field at row index 7 with field index 2" do
      it "return nil" do
        message1 = 7
        message2 = 2
        expected = nil
        expect(pastri7.get_field_by_indexes(message1,message2)).to eq(expected)
      end
    end

    context "When use 7 rows pascal triangle sum of row at index 7" do
      it "return nil" do
        message = 7
        expected = nil
        expect(pastri7.get_row_sum(message)).to eq(expected)
      end
    end

    context "When use 7 rows pascal triangle sum of row at index 5" do
      it "return 32" do
        message = 5
        expected = 32
        expect(pastri7.get_row_sum(message)).to eq(expected)
      end
    end

    context "When use 4 rows pascal triangle to see length of row at index 3" do
      it "return 4" do
        message = 3
        expected = 4
        expect(pastri4.get_length_of_row(message)).to eq(expected)
      end
    end

    context "When use 4 rows pascal triangle to see length of row at index 5" do
      it "return nil" do
        message = 5
        expected = nil
        expect(pastri4.get_length_of_row(message)).to eq(expected)
      end
    end

  end

end
