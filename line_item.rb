class LineItem
  attr_reader :name, :type, :amount, :city
  @@all = []

  def initialize(hash, city)
    @name = hash[:name]
    @type = hash[:type]
    @amount = hash[:amount]
    @city = city
    @@all << self
  end

  def self.format_for_display
    "#{name} $#{amount}"
  end

  def self.all
    @@all
  end
end
