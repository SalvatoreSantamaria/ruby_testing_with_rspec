# First steps and concepts

### RSpec hierarchy
example group > nested group > example > expectations

### Example group
basic format for describe or context

### Example
it 'a string, or a Class goes here' do
end

### Expectations
Example has four main parts

expect, an argument to expect, the method .to, and an argument to .to
expect(Car.colors).to match_array(c)

basic format for expect
expect(something).to(something)
expect(something).not_to(something)

### Describe string syntax
describe '.colors' do #for class methods use this syntax
describe '#full_name' do #for instance methods use this syntax


### Basic Example format
    it "allows reading and writing for :make" do
      car = Car.new #Create value
      car.make = 'Test' #Set value
      expect(car.make).to eq('Test') #test value
    end

### Format with Documentation
add -f d to command for format documenation 
example: rspec spec/car_spec.rb -f d

### Pending Tests
Either omit the do end block or use pending inside the block

### Skipping
Use xdescribe or xit or skip inside the block