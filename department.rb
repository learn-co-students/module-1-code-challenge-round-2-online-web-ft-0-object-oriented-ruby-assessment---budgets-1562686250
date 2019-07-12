class Department
    attr_reader :name, :city

    @@all =[]

    def initialize(name, city)
        @name = name
        @city = city 
        @@all << self 
    end 

    def self.all
        @@all
    end 

    #def self.create(name, city)
        #department = self.new(name, city)
        #department.save
        #department
    #end

    #def self.find_by_name(name, city)
        #all.detect {|department| department.name == name}
    #end 

    def self.find_or_create(name, city)
        find_by_name(name, city) || create(name, city)
    end 

end 