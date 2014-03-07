require 'rspec'
require_relative '../lib/fraction'


describe Fraction do
  let(:half) { Fraction.new(1, 2) }
  let(:other) { Fraction.new(5, 6) }
  let(:half2) { Fraction.new(1, 2) }
  let(:full)  { Fraction.new(4, 8) }

  it 'checks reduce' do
    expect((full.reduce).inspect).to eq(Fraction.new(1,2).inspect)
  end

  it 'multiplies 2 fractions' do
    expect((half * other).inspect).to eq(Fraction.new(5,12).inspect)
  end

  it 'subtractes 2 fractions' do
    expect((other - half).inspect).to eq(Fraction.new(1,3).inspect)
  end

  it 'divides 2 fractions' do
    expect((other / half).inspect).to eq(Fraction.new(5,3).inspect)
  end

  it 'compares 2 fractions to see if equal' do
    expect(half2 == half).to eq(true)
    expect(half2 == full).to eq(true)
  end

  it 'compares 2 fractions to see if less than' do
    expect(other > full).to eq(true)
  end
  it 'compares 2 fractions to see if greater than' do
    expect(full < other).to eq(true)
  end
end
