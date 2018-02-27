require 'csv'

class Company
  attr_reader :employees, :projects, :timesheets
  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(filepath)
    begin
      CSV.foreach(filepath) do |row|
        @employees << Employee.new(row[0], row[1], row[2], row[3], row[4])
      end
      { success: true, error: nil }
    rescue NoMethodError
      { success: false, error: 'bad data' }
    end
  end
end
