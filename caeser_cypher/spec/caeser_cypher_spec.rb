require 'spec_helper'

describe '#c_cypher' do
  
  
  it 'returns a string' do
    expect(c_cypher({string: "test", index: 2})).to be_a(String)
  end
  
  it 'shifts a character by a given index number' do
    index = 5
    expect(c_cypher({string: 'a', index: index})).to eq('f')
  end
  
  it 'returns "a" when shifting "z" by an index of 1' do
    expect(c_cypher({string: "z", index: 1})).to eq("a")
  end
  
  it 'returns "A" when shifting "Z" by an index of 1' do
    expect(c_cypher({string: "Z", index: 1})).to eq("A")
  end
  
  it 'accepts multiple characters' do
    expect(c_cypher({string: "hello", index: 1})).to eq("ifmmp")
  end
  
  it 'leaves capitalization' do
    expect(c_cypher({string: 'ABCXYZ', index: 1})).to eq('BCDYZA')
  end
  
  it 'leaves special characters' do
    expect(c_cypher({string: '.!?:;,@#$%&', index: 5})).to eq('.!?:;,@#$%&')
  end
  
  it 'translates multiple words' do
    expect(c_cypher({string: 'hello world', index: 1})).to eq('ifmmp xpsme')
  end

end