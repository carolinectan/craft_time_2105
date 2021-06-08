require './lib/event'

RSpec.describe Event do
  before :each do
    @event = Event.new("Carla's Craft Connection", [craft], [person])
  end

  it 'exists' do
    expect(@event).to be_a(Event)
  end

  it 'initializes with attributes' do
    expect(@event.name).to eq("Carla's Craft Connection")
    expect(@event.crafts).to eq([@craft])
    expect(@event.attendees).to eq([@person])

  end
end
