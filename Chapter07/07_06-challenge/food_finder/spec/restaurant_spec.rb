require 'restaurant'

describe Restaurant do

  let(:test_file) { 'spec/fixtures/restaurants_test.txt' }
  let(:crescent) { Restaurant.new(:name => 'Crescent', :cuisine => 'paleo', :price => '321') }
  
  describe 'attributes' do
  
    it "allow reading and writing for :name" do 
      subject.name = 'new_name'
      expect(subject.name).to eq('new_name')
    end

    it "allow reading and writing for :cuisine" do 
      subject.cuisine = 'italian'
      expect(subject.cuisine).to eq('italian')
    end

    it "allow reading and writing for :price" do
      subject.price = '456'
      expect(subject.price).to eq('456')
    end
    
  end
  
  describe '.load_file' do

    it 'does not set @@file if filepath is nil' do
      no_output { Restaurant.load_file(nil) }
      expect(Restaurant.file).to be_nil
    end
    
    it 'sets @@file if filepath is usable' do
      no_output { Restaurant.load_file(test_file) }
      expect(Restaurant.file).not_to be_nil
      expect(Restaurant.file.class).to be(RestaurantFile)
      expect(Restaurant.file).to be_usable
    end

    it 'outputs a message if filepath is not usable' do
      expect do
        Restaurant.load_file(nil)
      end.to output(/not usable/).to_stdout
    end
    
    it 'does not output a message if filepath is usable' do
      expect do
        Restaurant.load_file(test_file)
      end.not_to output.to_stdout
    end
    
  end
  
  describe '.all' do #class methods
    #number of restaurants have changed because i have loaded more
    xit 'returns array of restaurant objects from @@file' do
      Restaurant.load_file(test_file)
      restaurants = Restaurant.all
      expect(restaurants.class).to eq(Array)
      expect(restaurants.length).to eq(6)
      expect(restaurants.first.class).to eq(Restaurant)
    end

    it 'returns an empty array when @@file is nil' do
      no_output { Restaurant.load_file(nil) }
      restaurants = Restaurant.all
      expect(restaurants).to eq([])
    end
    
  end
  
  describe '#initialize' do

    context 'with no options' do #instance methods
      # subject would return the same thing
      let(:no_options) { Restaurant.new }

      it 'sets a default of "" for :name' do
        expect(no_options.name).to eq('')
        #expect(subject.name).to eq('')#subject works for these too
      end

      it 'sets a default of "unknown" for :cuisine' do
        expect(no_options.cuisine).to eq('unknown')
      end 

      it 'does not set a default for :price' do
        expect(no_options.price).to eq(nil)
      end
    end
    
    context 'with custom options' do
      let(:restaurant) {Restaurant.new}
      it 'allows setting the :name' do
        restaurant.name = "Ixtapa"
        expect(restaurant.name).to eq("Ixtapa")
      end

      it 'allows setting the :cuisine' do
        restaurant.cuisine = "Mexican"
        expect(restaurant.cuisine).to eq("Mexican")
      end


      it 'allows setting the :price' do
        restaurant.price = '1'
        expect(restaurant.price).to eq('1')
      end
    end

  end
  
  describe '#save' do
    
    it 'returns false if @@file is nil' do
      #not loading a file here
      expect(Restaurant.file).to be(nil)
      expect(crescent.save).to be false #cresent is set on line 6
    end

    it 'returns false if not valid' do
      #load a file
      Restaurant.load_file('test123')
      expect(subject.save).to be(false)
    end
    
    it 'calls append on @@file if valid' do
      #@@file is Restaurant.file
    Restaurant.load_file(test_file) #load it, make sure it has a value
    #message expectation on a partial test double
    expect(Restaurant.file).to receive(:append).with(crescent) #Restaurant.file receives the append method
    #with the name of the restaurant
    crescent.save
    end

    
  end
  
  describe '#valid?' do
    
    it 'returns false if name is nil' do
      crescent.name = nil
      expect(crescent.valid?).to be(false)
    end

    it 'returns false if name is blank' do
      crescent.name = ''
      expect(crescent.valid?).to be(false)
    end

    it 'returns false if cuisine is nil' do
      crescent.cuisine = nil
      expect(crescent.valid?).to be(false)
    end

    it 'returns false if cuisine is blank' do
      crescent.cuisine = ''
      expect(crescent.valid?).to be(false)
    end
    
    it 'returns false if price is nil' do
      crescent.price = nil
      expect(crescent.valid?).to be(false)
    end

    it 'returns false if price is 0' do
      crescent.price = 0
      expect(crescent.valid?).to be(false)
    end

    it 'returns false if price is negative' do 
      crescent.price = -1
      expect(crescent.valid?).to be(false)
    end

    it 'returns true if name, cuisine, price are present' do
      expect(crescent.valid?).to be(true)
    end
    
  end
end
