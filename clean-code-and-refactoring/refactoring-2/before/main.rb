class Report
  attr_reader :income, :expense, :tax, :date

  def initialize(income, expense, type, date)
    @income = income
    @expense = expense
    @tax = Tax.new(type)
    @date = date
  end
end

def average_income_in(date_range)
  ### Truncated code
  total_days = (date_range.end_date - date_range.start_date).to_i
  total_income / total_days
end

class DateRange
  attr_reader :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end
end

class Tax
  ### Truncated code
  def income_tax(gross_income)
    case @type
    when 'INDIVIDUAL'
      gross_income * 0.1
    when 'ENTERPRISE'
      gross_income * 0.2
    when 'GOVERNMENT'
      gross_income * 0.05
    else gross_income * 0.3
    end
  end
  ### Other methods with related switch statements
end

### Client code
income_tax = report.tax.income_tax(gross_income)

def print_tax_report(tax, gross_income)
  puts tax.income_tax(gross_income)
end

print_tax_report(Tax.new(type: 'INDIVIDUAL'), 10000)
