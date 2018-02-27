require './modules/date_handler'
require './lib/company'

class Audit
  def initialize
    @company = nil
  end

  def load_company(company)
    @company = company
  end

  def were_invalid_days_worked
    @company.timesheets.each do |timesheet|
      analysis = DHDate.new(timesheet)
    end
  end

  def valid_employee?(id)
    true if @company.find_employee_by_id(id)
  end

  def valid_project?(id)
    true if @company.find_project_by_id(id)
  end

  def worked_outside_of_project?(date, project)

  end

  def worked_during_weekend?(date)

  end
end
