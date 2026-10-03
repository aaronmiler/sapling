require 'rails_helper'

RSpec.describe ApplicationService do
  let(:service_class) do
    Class.new(described_class) do
      def call(value, multiplier:)
        value * multiplier
      end
    end
  end

  describe ".call" do
    it "forwards positional and keyword args to #call" do
      expect(service_class.call(2, multiplier: 3)).to eq(6)
    end
  end
end
