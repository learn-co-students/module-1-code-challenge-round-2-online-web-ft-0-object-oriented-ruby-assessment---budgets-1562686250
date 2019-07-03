class City
  attr_reader :name

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

  def self.display_name(name)
    parts = name.split('-')
    capitalized = parts.map do |part|
      part.capitalize
    end
    capitalized.join(' ')
  end

  def expenses
    line_items.select do |item|
      item.type == "revenue"
    end
  end

  def total_expenses
    expenses.map do |e|
      e.amount
    end.sum
  end

  def most_expensive_line_item
    sorted = expenses.sort_by do |e|
      e.amount
    end
    most_expensive = sorted.first
    most_expensive.format_for_display
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
end
