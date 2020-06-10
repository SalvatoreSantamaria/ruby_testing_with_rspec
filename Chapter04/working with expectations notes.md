## Fundamentals
One expectation per example because you will only see first failure

### Matchers
Used as arguments to .to()
Expectations are the statements, matchers provide the variety and complexity

#### Types
Equivalence matchers, 
Truthiness matchers, 
Numeric-comparison matchers, 
Collection matchers, 
Observation matchers, 
and each one allows us to different kinds of things

Equivalence
expect(x).to eq(1) #most common 
expect(x).to be == 1 #same thing as above

Truthiness Matchers
expect(1 < 2).to be(true)
expect('some string').to be_truthy #or be_falsy

Numeric Comparison Matchers
expect(100).to eq(100)
expect(100).to be == 100