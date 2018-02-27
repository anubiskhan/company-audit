require './modules/date_handler'

class Audit
  def initialize
    @company = nil
  end

  def load_company(company)
    @company = company
  end

  def were_invalid_days_worked
    @company.timesheets.each do |timesheet|
      analysis = DHDate.new()
  end
end
