require './test/test_helper'
require './lib/company'
require './lib/employee'

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
    assert_equal ({ success: true, error: nil }), employees_good
  end

  def test_load_employees_works_for_bad_data
    employees_bad = @company.load_employees('./data/bad_employees.csv')

    assert_equal ({ success: false, error: 'bad data' }), employees_bad
  end
end
