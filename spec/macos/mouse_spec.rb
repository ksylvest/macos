# frozen_string_literal: true

RSpec.describe MacOS::Mouse do
  let(:mouse) { described_class.new }

  let(:x) { 4 }
  let(:y) { 8 }

  describe "#position" do
    subject(:position) { mouse.position }

    let(:event) { double }
    let(:point) { { x:, y: } }

    it "uses 'CGEventGetLocation'" do
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventCreate) { event }
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventGetLocation) { point }
      allow(MacOS::Library::CoreGraphics).to receive(:CFRelease)
      position
      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventGetLocation).with(event)
      expect(MacOS::Library::CoreGraphics).to have_received(:CFRelease).with(event)
    end
  end

  describe "#move" do
    subject(:move) { mouse.move(x:, y:) }

    it "uses 'CGWarpMouseCursorPosition'" do
      allow(MacOS::Library::CoreGraphics).to receive(:CGWarpMouseCursorPosition)
      move
      expect(MacOS::Library::CoreGraphics).to have_received(:CGWarpMouseCursorPosition)
    end
  end

  describe "#trigger" do
    subject(:trigger) { mouse.trigger(type:, x:, y:) }

    let(:hid_event_tap) { MacOS::Library::CoreGraphics::EventTapLocation::HID_EVENT_TAP }
    let(:type) { MacOS::Library::CoreGraphics::EventType::MOUSE_MOVED }
    let(:event) { double }

    it "uses 'CGEventCreateMouseEvent' with 'type', 'x', 'y', and 'button'" do
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventCreateMouseEvent) { event }
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventPost)
      allow(MacOS::Library::CoreGraphics).to receive(:CFRelease)
      trigger
      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventCreateMouseEvent)
      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventPost).with(hid_event_tap, event)
      expect(MacOS::Library::CoreGraphics).to have_received(:CFRelease).with(event)
    end
  end

  describe "#left_down" do
    subject(:left_down) { mouse.left_down(x:, y:) }

    let(:type) { MacOS::Library::CoreGraphics::EventType::LEFT_MOUSE_DOWN }
    let(:button) { MacOS::Library::CoreGraphics::MouseButton::LEFT }

    it "uses 'trigger' with 'CG::EventType::LEFT_MOUSE_DOWN'" do
      allow(mouse).to receive(:trigger)
      left_down
      expect(mouse).to have_received(:trigger).with(x:, y:, type:, button:)
    end
  end

  describe "#left_up" do
    subject(:left_up) { mouse.left_up(x:, y:) }

    let(:type) { MacOS::Library::CoreGraphics::EventType::LEFT_MOUSE_UP }
    let(:button) { MacOS::Library::CoreGraphics::MouseButton::LEFT }

    it "uses 'trigger' with 'CG::EventType::LEFT_MOUSE_UP'" do
      allow(mouse).to receive(:trigger)
      left_up
      expect(mouse).to have_received(:trigger).with(x:, y:, type:, button:)
    end
  end

  describe "#left_click" do
    subject(:left_click) { mouse.left_click(x:, y:) }

    it "uses 'left_down' and 'left_up'" do
      allow(mouse).to receive(:left_down)
      allow(mouse).to receive(:left_up)
      left_click
      expect(mouse).to have_received(:left_down).with(x:, y:)
      expect(mouse).to have_received(:left_up).with(x:, y:)
    end
  end

  describe "#right_down" do
    subject(:right_down) { mouse.right_down(x:, y:) }

    let(:type) { MacOS::Library::CoreGraphics::EventType::RIGHT_MOUSE_DOWN }
    let(:button) { MacOS::Library::CoreGraphics::MouseButton::RIGHT }

    it "uses 'trigger' with 'CG::EventType::RIGHT_MOUSE_DOWN'" do
      allow(mouse).to receive(:trigger)
      right_down
      expect(mouse).to have_received(:trigger).with(x:, y:, type:, button:)
    end
  end

  describe "#right_up" do
    subject(:right_up) { mouse.right_up(x:, y:) }

    let(:type) { MacOS::Library::CoreGraphics::EventType::RIGHT_MOUSE_UP }
    let(:button) { MacOS::Library::CoreGraphics::MouseButton::RIGHT }

    it "uses 'trigger' with 'CG::EventType::RIGHT_MOUSE_UP'" do
      allow(mouse).to receive(:trigger)
      right_up
      expect(mouse).to have_received(:trigger).with(x:, y:, type:, button:)
    end
  end

  describe "#right_click" do
    subject(:right_click) { mouse.right_click(x:, y:) }

    it "uses 'right_down' and 'right_up'" do
      allow(mouse).to receive(:right_down)
      allow(mouse).to receive(:right_up)
      right_click
      expect(mouse).to have_received(:right_down).with(x:, y:)
      expect(mouse).to have_received(:right_up).with(x:, y:)
    end
  end

  describe "#middle_down" do
    subject(:middle_down) { mouse.middle_down(x:, y:) }

    let(:type) { MacOS::Library::CoreGraphics::EventType::OTHER_MOUSE_DOWN }
    let(:button) { MacOS::Library::CoreGraphics::MouseButton::CENTER }

    it "uses 'trigger' with 'CG::EventType::middle_MOUSE_DOWN'" do
      allow(mouse).to receive(:trigger)
      middle_down
      expect(mouse).to have_received(:trigger).with(x:, y:, type:, button:)
    end
  end

  describe "#middle_up" do
    subject(:middle_up) { mouse.middle_up(x:, y:) }

    let(:type) { MacOS::Library::CoreGraphics::EventType::OTHER_MOUSE_UP }
    let(:button) { MacOS::Library::CoreGraphics::MouseButton::CENTER }

    it "uses 'trigger' with 'CG::EventType::middle_MOUSE_UP'" do
      allow(mouse).to receive(:trigger)
      middle_up
      expect(mouse).to have_received(:trigger).with(x:, y:, type:, button:)
    end
  end

  describe "#middle_click" do
    subject(:middle_click) { mouse.middle_click(x:, y:) }

    it "uses 'middle_down' and 'middle_up'" do
      allow(mouse).to receive(:middle_down)
      allow(mouse).to receive(:middle_up)
      middle_click
      expect(mouse).to have_received(:middle_down).with(x:, y:)
      expect(mouse).to have_received(:middle_up).with(x:, y:)
    end
  end
end
