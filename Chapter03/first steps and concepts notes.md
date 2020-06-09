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