# Add your implementation of the Department class here
class Department 
    attr_reader :name, :city
    @@all = []
    def initialize(name, city)
        @name = name
        @city = city
        @@all << self 
    end 
    def self.all
        @@all
    end 
    # def self.create
    #     city = self.new 
    #     city.save 
    #     city
#     end 
#     def self.create_by_name(name)
#         cityName = self.create
#         cityName.name = name
#         cityName
#       end 
#    def self.find_by_name(find_name)
#      self.all.detect {|location| location.name == find_name}
#   end 
#   def self.find_by_city(find_city)
#     self.all.detect {|city| city.name == find_city}
#  end 

    def self.find_or_create(city, name)
        find_by_name(name, city) || create(city, name)
    end 

end 

#I am choosing to leave what I commented out because I want feedback on my code
#I couldn't figure out how to record myself in zoom so I left it for this reason.