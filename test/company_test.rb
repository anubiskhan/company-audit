require './test/test_helper'
require './lib/company'

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

  def test_load_employees
    employees_good = @company.load_employees('./data/employees.csv')
    employees_bad = @company.load_employees('./data/bad_employees.csv')

    assert_instance_of Hash, employees_good
    assert employees_good.include?('success')
    assert employees_bad.include?('error')
  end
end
