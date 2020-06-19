## What are test doubles?
Test doubles are an object that stands in for another object
Aliases: Doubles, mocks, stubs, fakes, spies, dummies

### Double/Mock
A simple object preprogrammed with expectations and responses as preparation for the calls it will receive

### Stub - a fake method
An instruction to an object to return a specific response to a method call

### Double Example
it 'allows stubbing methods' do
    dbl = double('Chant') #create object
    allow(dbl).to receive(:hey!) #give object thing to do, or a 'fake method' here
    expect(dbl).to respond_to(:hey!)
end

it 'allows stubbing methods' do
    dbl = double('Chant') #create object
    allow(dbl).to receive(:hey!).and_return('Ho!')#give object thing to do, or a 'fake method' here, and return {'Ho!'}
    allow(dbl).to receive(:hey!) {'Ho!'} #same as above, but can use logic in the return block here
    expect(dbl.hey!).to eq('Ho!')
end

it 'allows setting multiple responses' do
    die = double('Die')
    allow(die).to receive(:roll).and_return(1,5,2,6)
    expect(die.roll).to eq(1)
    expect(die.roll).to eq(5)
    expect(die.roll).to eq(2)
    expect(die.roll).to eq(6)
end

### Partial Test Doubles
Adding a method .to receive(:some_non_existant_method).and_return('Something it wouldn't normally return')

### Message Expectations
Ruby sends 'messages' to objects to call methods. RSpec can set expectations about those messages

#instead of 
allow(dbl).to receive(:hey!).and_return("Ho!")
expect(dbl.hey!).to eq("Ho!")

#it looks like
expect(dbl).to receive(:hey!).and_return("Ho!") #this is now an expect statement
dbl.hey! #call method by itself

### Message Argument Constraints
This is using .with
expect(dbl).to receive(:sort).with(any_args) #any_args is the default
expect(dbl).to receive(:sort).with(name)
dble.sort('name')

### Message Count Constraints
Verifies how many times a method gets called during an example

once
twice
exactly(n)
at_least(:once) at_least(:twice) at_least(n).times
at_most(:once) at_most(:twice) at_most(n).times

expect(post).to receive(:like).exactly(3).times
post.like(:user => 'Bob1')
post.like(:user => 'Bob2')
post.like(:user => 'Bob3')