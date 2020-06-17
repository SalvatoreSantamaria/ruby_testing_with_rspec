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