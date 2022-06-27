def get_total_net_income(reports)
  total_net_income = 0
  reports.each do |report|
    gross_income = report.income - report.expense
    net_income = report.tax.income_tax(gross_income)
    total_net_income = total_net_income + net_income
  end
  return total_net_income
end

def total_income_in(start_date, end_date, reports)
  ### Code
end

def total_expense_in(start_date, end_date, reports)
  ### Code
end

def total_net_income_in(start_date, end_date, reports)
  ### Code
end
