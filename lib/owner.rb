class Owner
  attr_reader :name, :species
  attr_accessor :pets, :dogs, :cats

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {:dogs => [], :cats => []}
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self }
  end

  def buy_cat (name)
    pets[:cats] << Cat.new(name, self)
  end

  def buy_dog (name)
    pets[:dogs] << Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end
    Dog.all.each do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end
  end


  def list_pets
    "I have #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end




end
