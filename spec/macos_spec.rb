# frozen_string_literal: true

RSpec.describe MacOS do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be_nil
  end

  describe '.mouse' do
    it 'is a mouse' do
      expect(described_class.mouse).to be_a(MacOS::Mouse)
    end
  end

  describe '.screen' do
    it 'is a screen' do
      expect(described_class.screen).to be_a(MacOS::Screen)
    end
  end
end
