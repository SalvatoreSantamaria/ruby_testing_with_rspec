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

###### Equivalence
expect(x).to eq(1) #most common 
expect(x).to be == 1 #same thing as above

###### Truthiness Matchers
expect(1 < 2).to be(true)
expect('some string').to be_truthy #or be_falsy

###### Numeric Comparison Matchers
expect(100).to eq(100)
expect(100).to be == 100

###### Collection Matchers - Arrays, Hashes, Strings
arr = [1,2,3]
expect(arr).to match_array([3,2,1]) #in any order
expect(arr).to contain_exactly(3,2,1)

hash = {:city => 'Dallas', :state => 'TX'}
expect(hash).to include(:city) 
expect(hash).to include(:city => 'Dallas')

###### Other Matchers - see 04_07/spec/expectation_matchers_spec.rb
the Regular Expression matcher, 
the Object Type Matchers, 
Respond To Matcher, 
Attribute Matcher, 
and Satisfy Matcher.

###### Predicate Matchers - dynamically defined

arr.nil? or arr.odd? or arr.be_even? etc
expect(value).to be_nil / be_odd / be_even / be_integer etc. 

useful for custom methods, with a ? such as 

arr.visible?
where visible is a function below....
visible?(x) do ... end
.to be_visible

###### Observation Matchers - see Chapter04/04_09/car_project
Uses a block instead of an argument
expect {}.to()

array = []
expect { array << 1 }.to change(arr, :empty?).from(true).to(false)

another example

expect do
    bob.first_name = 'Robert'
    bob.last_name = 'Smith'
end.to change(bob, :full_name).from('Bob Smith').to('Robert Smith')

###### Observe Output
Not really useful for Ruby on Rails
expect {}.to output.to_stdout

###### Complex Expectations
Complex Expectations uses and, or
.and &
.or | 

###### Composing Matcher - see Chapter04/04_10-final/car_project
matchers that accept other matchers