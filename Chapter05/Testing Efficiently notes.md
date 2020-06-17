### Hooks
Use instance variables to make objects available to examples

*customer* is a local variable and will not be available
*@customer* is an instance variable and will be available

describe 'Car' do
  describe 'attributes' do

    #added
    before(:example) do
        @car = Car.new
    end


    it "allows reading and writing for :make" do
      #removed car = Car.new
      @car.make = 'Test'
      expect(@car.make).to eq('Test')
    end
    
    it "allows reading and writing for :year" do
      #removed car = Car.new
      @car.year = 9999
      expect(@car.year).to eq(9999)
    end
  end
end

### Let method
let(:car) {...} #lazy executed, waits
let!(:car) {...} #eager executed, runs right away
Let method should be used for variables

let(:car) { Car.new }
it 'allows reading for :wheels' do
    expect(car.wheels).to eq(4)  #car.wheels is a METHOD call
end

### Setting a subject
Shorthand thats available, don't have to use it.
Can use 'subject' instead of 'let' if variable is subject of example

let(:subject) { Car.new } #var is subject of example
subject { Car.new } #shorthand, same as above, because so common. subject!{...} also eager executed

it 'allows reading for :wheels' do
    expect(subject.wheels).to eq(4)  #car.wheels is a METHOD call
end

### Implicitly defined subjects
Describe can accept either a string or a class name

decribe Car
    it "...."

#instead of

describe 'car'
    subject { Car.new }

    it "...."

### Shared Examples
It's a shared file that can be used across different classes