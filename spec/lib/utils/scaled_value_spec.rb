RSpec.describe ScaledValue do
  let(:scaled_value) { described_class.new(value, input_scale) }
  let(:value) { 100 }
  let(:input_scale) { 3 }

  describe '#actual_value' do
    it 'is a BigDecimal' do
      expect(scaled_value.actual_value).to be_a(BigDecimal)
    end

    it 'returns the correct scaled value' do
      expect(scaled_value.actual_value).to eq(100000.to_d)
    end

    context 'when value is nil' do
      let(:value) { nil }

      it 'returns nil' do
        expect(scaled_value.actual_value).to be_nil
      end
    end
  end
end
