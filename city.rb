class City
  attr_reader :name

  @@all =[]
  def initialize(city_data)
    @name = city_data[:name]
    city_data[:line_items].map do |li| 
      LineItem.new(li, self)
    end
  end

  def line_items
    LineItem.all.select do |item|
      item.city == self
    end
  end

  def display_name
    parts = name.split('-')
    capitalized = parts.map do |part|
      part.capitalize
    end
    capitalized.join(' ')
  end

  def expenses
    line_items.select do |item|
      item.type == "expense"
    end
  end

  def total_expenses
    expenses.sum do |e|
      e.amount.abs
    end
  end

  def most_expensive_line_item
    sorted = expenses.sort_by do |e|
      e.amount
    end
    most_expensive = sorted.last
    most_expensive_formatted = "#{most_expensive.name.to_s} $#{most_expensive.amount.to_s}"
    
  end

  def get_total
    line_items.map do |li|
      li.amount
    end.sum
  end

  def revenues
    line_items.select do |item|
      item.type == "revenue"
    end
  end

  def total_revenues
    revenues.sum do |e|
      e.amount
    end 
  end 

  def departments
    @@all 
    
  end 

  #I could not figure out how to return the correct number of departments, I kept getting zero.

  def number_of_departments
    departments.sum do |department|
      department.size
    end 
  end 
end
