def get_total_net_income(reports)
  reports.sum { |report| get_net_income(report) }
end

def get_net_income(report)
  gross_income = report.income - report.expense
  gross_income - report.tax.income_tax(gross_income)
end

def total_income_in(date_range)
  ### Change start_date to date_range.start_date and end_date respectively
end
### Other method truncated for presentation purpose

class DateRange
  attr_reader :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end
end
