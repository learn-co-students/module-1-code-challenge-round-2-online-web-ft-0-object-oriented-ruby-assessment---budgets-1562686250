class LineItem
  attr_reader :name, :type, :amount 

  def initialize(hash, city)
    @name = hash[:name]
    @type = hash[:type]
    @amount = hash[:amount]
  end

  def self.format_for_display
    "#{name} $#{amount}"
  end
end
