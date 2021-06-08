class Person
  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, quantity)
    @supplies[supply] += quantity
  end

  def can_build?(type)
    supplies = type.supplies_required.keys.map do |sup|
      sup.to_s
    end

    result = supplies.map do |supply|
      @interests.include?(supply)
    end
# require "pry"; binding.pry
    if @interests.any?(supplies)
      true
    else
      false
    end
  end
end
