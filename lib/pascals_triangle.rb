class PascalsTriangle

  STARTING_ROW = [1].freeze

  def initialize(number_of_rows)
    generate_triangle(number_of_rows)
  end

  def get_number_of_rows
    @triangle.length
  end

  def get_row(row_index)
    @triangle[row_index]
  end

  def get_field_by_indexes(row_index, column_index)
    @triangle[row_index][column_index] if row_exist?(row_index)
  end

  def get_row_sum(row_index)
    @triangle[row_index].inject { |sum, n| sum + n } if row_exist?(row_index)
  end

  def get_length_of_row(row_index)
    @triangle[row_index].length if row_exist?(row_index)
  end

  private

  def row_exist?(row_index)
    @triangle[row_index]
  end

  def generate_triangle(number_of_rows)
    @triangle = [STARTING_ROW]
    while @triangle.length < number_of_rows do
      create_row
    end
  end

  def create_row
    calculation_helper_arr = prepare_calculation_helper_arr
    @triangle.push([])
    fill_last_row(calculation_helper_arr)
  end

  def prepare_calculation_helper_arr
    calculation_helper_arr = []
    @triangle.last.each do |field|
      calculation_helper_arr.push(field, field)
    end
    calculation_helper_arr.unshift(nil)
    calculation_helper_arr.push(nil)
  end

  def fill_last_row(calculation_helper_arr)
    prev_field = nil
    calculation_helper_arr.each_with_index do |field, index|
      @triangle.last.push(calculate_new_member(field, prev_field)) unless index.even?
      prev_field = field
    end
  end

  def calculate_new_member(field, prev_field)
    if field.nil?
      prev_field
    elsif prev_field.nil?
      field
    else
      prev_field + field
    end
  end

end
