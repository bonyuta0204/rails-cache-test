class ScaledValue
  def initialize(value, input_scale)
    @value = value&.to_d.freeze
    @input_scale = input_scale.freeze
  end

  attr_reader :value, :input_scale

  def actual_value
    return nil if value.nil?

    @value * (10**input_scale)
  end
end
