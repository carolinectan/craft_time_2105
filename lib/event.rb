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
end
