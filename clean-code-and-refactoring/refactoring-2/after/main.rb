class Report
  attr_reader :income, :expense, :tax, :date

  def initialize(income, expense, type, date)
    @income = income
    @expense = expense
    @tax = Tax.new(type)
    @date = date
  end

  def income_tax
    @tax.income_tax(@income)
  end
end

def average_income_in(date_range)
  ### Truncated code
  total_days = date_range.get_number_of_days
  total_income / total_days
end

class DateRange
  attr_reader :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def get_number_of_days
    (date_range.end_date - date_range.start_date).to_i
  end
end

class Tax
  def initialize
    raise NotImplementedError
  end

  def income_tax(gross_income)
    raise NotImplementedError
  end
end

class IndividualTax < Tax
  def initialize; end
  def income_tax(gross_income); gross_income * 0.1; end
end

class EnterpriseTax < Tax
  def initialize; end
  def income_tax(gross_income); gross_income * 0.2; end
end

class GovernmentTax < Tax
  def initialize; end
  def income_tax(gross_income); gross_income * 0.05; end
end

class BasicTax < Tax
  def initialize; end
  def income_tax(gross_income); gross_income * 0.3; end
end

### Client code
income_tax = report.income_tax

def print_tax_report(tax, gross_income)
  puts tax.income_tax(gross_income)
end

print_tax_report(IndividualTax, 10000)
