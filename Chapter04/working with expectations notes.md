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

Collection Matchers - Arrays, Hashes, Strings
arr = [1,2,3]
expect(arr).to match_array([3,2,1]) #in any order
expect(arr).to contain_exactly(3,2,1)

hash = {:city => 'Dallas', :state => 'TX'}
expect(hash).to include(:city) 
expect(hash).to include(:city => 'Dallas')

Other Matchers - see 04_07/spec/expectation_matchers_spec.rb
the Regular Expression matcher, 
the Object Type Matchers, 
Respond To Matcher, 
Attribute Matcher, 
and Satisfy Matcher.