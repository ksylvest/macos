# frozen_string_literal: true

RSpec.describe MacOS::Display do
  let(:display) { described_class.new }

  describe ".main" do
    subject(:main) { described_class.main }

    it "returns the main display" do
      allow(MacOS::Library::CoreGraphics).to receive(:CGMainDisplayID).and_return(0)
      expect(main).to be_a(described_class)
    end
  end

  describe "#bounds" do
    let(:bounds) { display.bounds }

    it "uses 'CGDisplayBounds'" do
      allow(MacOS::Library::CoreGraphics).to receive(:CGDisplayBounds)
        .with(0)
        .and_return({
          size: {
            width: 2560,
            height: 1440,
          },
        })

      expect(bounds.width).to be(2560)
      expect(bounds.height).to be(1440)
    end
  end
end
