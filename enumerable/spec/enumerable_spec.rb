require 'spec_helper'

describe Enumerable do
  
  let(:arr) { [1, 2, 3, 4, 5] }
  
  describe '#my_select' do
    
    it 'returns elements that pass the block evaluation as true' do
      expect(arr.my_select {|i| i < 4}).to eq([1, 2, 3])
    end
  end
  
    context "when given a non-enumerable object" do
      it 'returns NoMethodError' do
        expect{ "Hello".my_select }.to raise_error(NoMethodError)
      end
    end
  

end