require './test/test_helper'
require './lib/company'
require './lib/employee'
require './lib/project'
require './lib/timesheet'

class CompanyTest < Minitest::Test
  def setup
    @company = Company.new
  end

  def test_instantiation
    assert_instance_of Company, @company
  end

  def test_attributes
    assert_equal [], @company.employees
    assert_equal [], @company.projects
    assert_equal [], @company.timesheets
  end

  def test_load_employees_works_for_good_data
    employees_good = @company.load_employees('./data/employees.csv')

    assert_equal 2, @company.employees.length
    assert_instance_of Employee, @company.employees[0]
    assert_equal ({ success: true, error: nil }), employees_good
  end

  def test_load_employees_works_for_bad_data
    employees_bad = @company.load_employees('./data/bad_employees.csv')

    assert_equal ({ success: false, error: 'bad data' }), employees_bad
  end

  def test_load_projects_works_for_good_data
    projects_good = @company.load_projects('./data/projects.csv')

    assert_equal 3, @company.projects.length
    assert_instance_of Project, @company.projects[0]
    assert_equal ({ success: true, error: nil }), projects_good
  end

  def test_load_projects_works_for_bad_data
    projects_bad = @company.load_projects('./data/bad_projects.csv')

    assert_equal ({ success: false, error: 'bad data' }), projects_bad
  end

  def test_load_timesheets_works_for_good_data
    timesheets_good = @company.load_timesheets('./data/timesheets.csv')

    assert_equal 25, @company.timesheets.length
    assert_instance_of Timesheet, @company.timesheets[0]
    assert_equal ({ success: true, error: nil }), timesheets_good
  end

  def test_load_timesheets_works_for_bad_data
    timesheets_bad = @company.load_timesheets('./data/bad_timesheets.csv')

    assert_equal ({ success: false, error: 'bad data' }), timesheets_bad
  end

  def test_company_find_employee_by_id
    @company.load_employees('./data/employees.csv')
    employee = @company.find_employee_by_id(1)

    assert_equal 1, employee.employee_id
    assert_equal 'Susan Smith', employee.name
    assert_equal 'Manager', employee.role
  end
end
