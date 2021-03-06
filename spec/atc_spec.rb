require './lib/plane'
require './lib/atc'

describe 'Air Traffic Control' do
 before(:each) do
   @plane = Plane.new
   @ATC = Atc.new(2)
 end

context 'Tells plane to land' do
 it 'checks to see if atc can tell plane to land'do
   expect(@ATC.land(@plane)).to eq true
  end
end

context "Tells plane to take off"do
  it 'checks to see if atc can tell plane to take off'do
    @ATC.weather = 1
    expect(@ATC.take_off(@plane)).to eq true
    end
  end

context 'Checks to see if plane has landed'do
  it 'checks to see if plane has landed'do
    @ATC.land(@plane)
    expect(@ATC.landed?(@plane)).to eq true
  end
end

context 'Checks to see if plane is in airport'do
  it 'checks to see if plane is in airport'do
    @ATC.weather = 1
    @ATC.take_off(@plane)
    expect(@plane.in_airport).to eq false
  end
end

context "Checks to see if plane DOESN'T take off in stormy weather"do
  it "Stormy weath means dont take off!" do
    expect(@ATC.take_off(@plane)).to be false
    end
  end

=begin
  context "Checks to see if airport is full"do
    it "Checks to see if airport is full"do
      21.times {@ATC.land(@plane)}
      @ATC.weather = 1
      expect(@ATC.full).to eq "full"
    end
  end
=end 
  describe "Checks to see if plane lands when airport is full"do
    it "Checks to see if plane lands when airport is full"do
      @ATC = Atc.new(1,1)
      @plane1 = Plane.new
      @plane2 = Plane.new
      @ATC.land(@plane1)
      expect{@ATC.land(@plane2)}.to raise_error('Dont land, airport is full')
    end
  end
end
