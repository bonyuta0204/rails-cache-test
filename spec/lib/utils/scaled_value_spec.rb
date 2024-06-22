RSpec.describe ScaledValue do
  let(:scaled_value) { described_class.new(value, input_scale) }
  let(:value) { 100 }
  let(:input_scale) { 3 }

  describe '#actual_value' do
    it 'is a BigDecimal' do
      expect(scaled_value.actual_value).to be_a(BigDecimal)
    end

    it 'returns the correct scaled value' do
      expect(scaled_value.actual_value).to eq(100_000.to_d)
    end

    context 'when value is nil' do
      let(:value) { nil }

      it 'returns nil' do
        expect(scaled_value.actual_value).to be_nil
      end
    end
  end

  describe '#formatted_string' do
    let(:value) { 1000 }
    let(:input_scale) { 6 }

    before do
      I18n.locale = :ja
    end

    it 'returns the formatted string with default precision' do
      expect(scaled_value.formatted_string(display_scale: 3)).to eq('1,000,000千')
    end

    it 'returns the formatted string with specified precision' do
      expect(scaled_value.formatted_string(display_scale: 3, precision: 1)).to eq('1,000,000.0千')
    end

    it 'raises an error if display scale is greater than 10' do
      expect do
        scaled_value.formatted_string(display_scale: 13)
      end.to raise_error('display scale should be smaller than 12')
    end
  end
end
