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
    result = @audit.were_invalid_days_worked

    assert_instance_of String, result
    assert result.include?('invalid employee id')
  end
end
