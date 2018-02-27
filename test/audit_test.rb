require './test/test_helper'
require './lib/company'
require './lib/audit'

class AuditTest < Minitest::Test
  def setup
    @audit = Audit.new
    @company = Company.new
    @company.load_employees('./data/employees.csv')
    @company.load_projects('./data/projects.csv')
    @company.load_timesheets('./data/timesheets.csv')
  end

  def test_instantiation
    assert_instance_of Audit, @audit
  end

  def test_can_load_company
    result = @audit.load_company(@company)

    assert_equal @company, result
  end

  def test_were_invalid_days_worked
    skip
    result = @audit.were_invalid_days_worked

    assert_instance_of String, result
    assert result.include?('invalid employee id')
  end

  def test_valid_employee
    @audit.load_company(@company)
    result_true = @audit.valid_employee?(1)
    result_false = @audit.valid_employee?(3)

    assert result_true
    refute result_false
  end

  def test_valid_project
    @audit.load_company(@company)
    result_true = @audit.valid_project?(1)
    result_false = @audit.valid_project?(4)

    assert result_true
    refute result_false
  end

  def test_worked_outside_of_project
    @audit.load_company(@company)
    result_true = @audit.worked_outside_of_project?(2017-06-01, 2)
    # result_false = @audit.worked_outside_of_project?(4)

    assert result_true
  end
end
