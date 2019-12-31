require 'spec_helper'

describe SpreeAvatax::Calculator do
  let(:calculator) { SpreeAvatax::Calculator.new }

  describe '.description' do
    it 'should not be nil' do
      expect(SpreeAvatax::Calculator.description).to eq I18n.t('spree.avatax_description')
    end
  end

  describe '#compute' do
    it 'should raise DoNotUseCompute' do
      expect {
        calculator.compute(nil)
      }.to raise_error(SpreeAvatax::Calculator::DoNotUseCompute)
    end
  end

end
