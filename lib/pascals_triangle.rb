class PascalsTriangle

  STARTING_ROW = [1].freeze

  def initialize(number_of_rows)
    @number_of_rows = number_of_rows.to_i
  end

  def to_s
    triangle.map { |row| row.join(" ") }.join("\n")
  end

  def to_a
    triangle
  end

  private

  def triangle
    @triangle || generate_triangle
  end

  def generate_triangle
    @triangle = [STARTING_ROW]
    (@number_of_rows-1).times do |row_number_index|
      @triangle.push(create_row(row_number_index+1))
    end
    @triangle
  end

  def create_row(row_num)
    row = STARTING_ROW.dup
    row_num.times do |field_num_index|
      row.push(row.last * (row_num + 1 - (field_num_index+1)) / (field_num_index+1))
    end
    row
  end

end
