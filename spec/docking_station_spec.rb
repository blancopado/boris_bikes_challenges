require 'docking_station'

describe DockingStation do

  describe 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    subject { DockingStation.new }
    let(:bike) { Bike.new}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Already full'
    end
  end 

  describe '#release_bike' do
    let(:bike) { Bike.new}
    let(:bike_broken) { Bike.new(false)}
    it { is_expected.to respond_to :release_bike }

    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises error when there are no more bikes available' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end

  end

  describe '#dock' do
    let(:bike) { Bike.new }
    
    it { is_expected.to respond_to(:dock).with(2) }
  
    it 'refuses to dock bike when already at capacity' do
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error("Already full")
    end
    
    it 'receives a report if bike is not working' do
     expect(subject.dock(bike, false)).to eq ("This bike is broken")
    end

  end
 
end

