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

  def formatted_string(display_scale: 0, precision: 0)
    if display_scale > 12
      raise "display scale should be smaller than 12"
    end

    numeric_value = actual_value / (10 ** display_scale)
    # set adequate precision for numeric_value
    numeric_value = numeric_value.round(precision)

    # add comma to numeric_value
    formatted_value = numeric_value.to_s(:delimited)

    "#{formatted_value}#{I18n.t("lib.scaled_value.scale.#{display_scale}")}"
  end
end
