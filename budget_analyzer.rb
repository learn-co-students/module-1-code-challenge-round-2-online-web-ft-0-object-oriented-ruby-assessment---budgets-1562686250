require_relative 'line_item'
require_relative 'city'
require_relative 'department'

# this file gives us the CITY_DATA_ARRAY
require_relative 'city_data'

class BudgetAnalyzer
  def run
    puts "Analyzing budgets..."
    CITY_DATA_ARRAY.map do |data|
      city = City.new(data)
      puts "--"
      puts display = city.name.capitalize
      puts "Total Expenses: $#{city.total_expenses}"
      puts "Most Expensive Line Item: #{city.most_expensive_line_item}"
      puts "Total: $#{city.get_total}"
      puts "Total Revenues: $#{city.total_revenues}"
      puts "Number of Departments: #{city.number_of_departments}"
    end
  end
end

BudgetAnalyzer.new.run
