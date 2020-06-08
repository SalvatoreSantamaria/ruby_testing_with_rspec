# encoding: UTF-8

#require 'lib/support/number_helper' DONT NEED TO
#run with (from 07_02-challenge/food_finder) rspec spec/support/number_helper_spec.rb

describe 'NumberHelper' do

  include NumberHelper
  
  describe '#number_to_currency' do
    
    context 'using default values' do
      
      it "correctly formats an integer" do
        expect(number_to_currency(2000)).to eq('$2,000.00')
      end
      
      it "correctly formats a float" do
        expect(number_to_currency(2000.00)).to eq('$2,000.00')
      end

      it "correctly formats a string" do
        expect(number_to_currency('2000')).to eq('$2,000.00')
      end
      
      it "uses delimiters for very large numbers" do
        expect(number_to_currency(200000)).to eq('$200,000.00')
      end

      it "does not have delimiters for small numbers" do
        expect(number_to_currency(2)).to eq('$2.00')
      end

    end
    
    context 'using custom options' do
      
      it 'allows changing the :unit'

      it 'allows changing the :precision'
      
      it 'omits the separator if :precision is 0'
      
      it 'allows changing the :delimiter'
      
      it 'allows changing the :separator'
            
      it 'correctly formats using multiple options'
      
    end
    
  end
  
end
