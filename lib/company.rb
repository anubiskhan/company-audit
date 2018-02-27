require 'csv'
require './lib/employee'
require './lib/project'
require './lib/timesheet'

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

  def load_projects(filepath)
    begin
      CSV.foreach(filepath) do |row|
        @projects << Project.new(row[0], row[1], row[2], row[3])
      end
      { success: true, error: nil }
    rescue NoMethodError
      { success: false, error: 'bad data' }
    end
  end

  def load_timesheets(filepath)
    begin
      CSV.foreach(filepath) do |row|
        @timesheets << Timesheet.new(row[0], row[1], row[2], row[3])
      end
      { success: true, error: nil }
    rescue NoMethodError
      { success: false, error: 'bad data' }
    end
  end

  def find_employee_by_id(id)
    @employees.find do |employee|
      employee.employee_id == id
    end
  end

  def find_project_by_id(id)
    @projects.find do |project|
      project.project_id == id
    end
  end
end
