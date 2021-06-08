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
    hash = @crafts.group_by do |craft|
      craft.supplies_required
    end

    max_supplies_amount = hash.keys.map do |hash|
      hash.values.sum
    end.max
    @crafts.select do |craft|
      return craft.name if max_supplies_amount == craft.supplies_required.values.sum
    end
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
end
