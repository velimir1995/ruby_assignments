class PascalsTriangle

  STARTING_ROW = [1].freeze

  def get_row(row_number)
    create_row(row_number)
  end

  def get_field(row_index, column_index)
    create_row(row_index)[column_index]
  end

  def get_row_sum(row_number)
    create_row(row_number).inject { |sum, n| sum + n }
  end

  def generate_triangle(number_of_rows)
    triangle = [STARTING_ROW]
    ((triangle.length+1)..number_of_rows.to_i).to_a.each do |row_number|
      triangle.push(create_row(row_number))
    end
    triangle
  end

  private

  def create_row(row_num)
    row  = STARTING_ROW.dup
    (row.length...row_num).to_a.reverse.each do |field_num|
      field_num == row_num ? row.push(1) : row.push(row.last * field_num / (row_num-field_num))
    end
    row
  end

end
