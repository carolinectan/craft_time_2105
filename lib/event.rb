class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |person|
      person.name
    end
  end

  def craft_with_most_supplies
    result = @crafts.max_by do |craft|
      craft.supplies_required.length
    end
    result.name
  end

  def supply_list
    arr_of_hashes = @crafts.map do |craft|
      craft.supplies_required
    end

    arr_of_hashes.flat_map do |hash|
      hash.keys.map do |key|
        key.to_s
      end
    end.uniq
  end

  def attendees_by_craft_interest
    hash = Hash.new

    @crafts.each do |craft|
      hash[craft.name] = @attendees.select do |person|
        person.interests.include?(craft.name)
      end
    end

    hash
  end #=>   "craft name"=>[person obj, person obj],

  def crafts_that_use(supply)
    @crafts.select do |craft|
        craft.supplies_required.keys.include?(supply.to_sym)
    end
  end
end
