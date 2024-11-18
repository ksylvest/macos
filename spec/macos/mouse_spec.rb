# frozen_string_literal: true

RSpec.describe MacOS::Mouse do
  let(:mouse) { described_class.new }

  let(:x) { 4 }
  let(:y) { 8 }

  describe '#position' do
    subject(:position) { mouse.position }

    let(:event) { double }
    let(:point) { instance_double(MacOS::CG::Point, x: 4, y: 8) }

    it "uses 'CGEventGetLocation'" do
      allow(MacOS::Library).to receive(:CGEventCreate) { event }
      allow(MacOS::Library).to receive(:CGEventGetLocation) { point }
      allow(MacOS::Library).to receive(:CFRelease)
      position
      expect(MacOS::Library).to have_received(:CGEventGetLocation).with(event)
      expect(MacOS::Library).to have_received(:CFRelease).with(event)
    end
  end

  describe '#move' do
    subject(:move) { mouse.move(x: x, y: y) }

    it "uses 'CGWarpMouseCursorPosition'" do
      allow(MacOS::Library).to receive(:CGWarpMouseCursorPosition)
      move
      expect(MacOS::Library).to have_received(:CGWarpMouseCursorPosition)
    end
  end

  describe '#trigger' do
    subject(:trigger) { mouse.trigger(type: type, x: x, y: y) }

    let(:type) { MacOS::CG::EventType::MOUSE_MOVED }
    let(:event) { double }

    it "uses 'CGEventCreateMouseEvent' with 'type', 'x', 'y', and 'button'" do
      allow(MacOS::Library).to receive(:CGEventCreateMouseEvent) { event }
      allow(MacOS::Library).to receive(:CGEventPost)
      allow(MacOS::Library).to receive(:CFRelease)
      trigger
      expect(MacOS::Library).to have_received(:CGEventCreateMouseEvent)
      expect(MacOS::Library).to have_received(:CGEventPost).with(MacOS::CG::EventTapLocation::HID_EVENT_TAP, event)
      expect(MacOS::Library).to have_received(:CFRelease).with(event)
    end
  end

  describe '#left_mouse_down' do
    subject(:left_mouse_down) { mouse.left_mouse_down(x: x, y: y) }

    it "uses 'trigger' with 'CG::EventType::LEFT_MOUSE_DOWN'" do
      allow(mouse).to receive(:trigger)
      left_mouse_down
      expect(mouse).to have_received(:trigger).with(
        type: MacOS::CG::EventType::LEFT_MOUSE_DOWN,
        x: x,
        y: y,
        button: MacOS::CG::MouseButton::LEFT
      )
    end
  end

  describe '#left_mouse_up' do
    subject(:left_mouse_up) { mouse.left_mouse_up(x: x, y: y) }

    it "uses 'trigger' with 'CG::EventType::LEFT_MOUSE_UP'" do
      allow(mouse).to receive(:trigger)
      left_mouse_up
      expect(mouse).to have_received(:trigger).with(
        type: MacOS::CG::EventType::LEFT_MOUSE_UP,
        x: x,
        y: y,
        button: MacOS::CG::MouseButton::LEFT
      )
    end
  end

  describe '#left_mouse_click' do
    subject(:left_mouse_click) { mouse.left_mouse_click(x: x, y: y) }

    it "uses 'left_mouse_down' and 'left_mouse_up'" do
      allow(mouse).to receive(:left_mouse_down)
      allow(mouse).to receive(:left_mouse_up)
      left_mouse_click
      expect(mouse).to have_received(:left_mouse_down).with(x: x, y: y)
      expect(mouse).to have_received(:left_mouse_up).with(x: x, y: y)
    end
  end

  describe '#right_mouse_down' do
    subject(:right_mouse_down) { mouse.right_mouse_down(x: x, y: y) }

    it "uses 'trigger' with 'CG::EventType::RIGHT_MOUSE_DOWN'" do
      allow(mouse).to receive(:trigger)
      right_mouse_down
      expect(mouse).to have_received(:trigger).with(
        type: MacOS::CG::EventType::RIGHT_MOUSE_DOWN,
        x: x,
        y: y,
        button: MacOS::CG::MouseButton::RIGHT
      )
    end
  end

  describe '#right_mouse_up' do
    subject(:right_mouse_up) { mouse.right_mouse_up(x: x, y: y) }

    it "uses 'trigger' with 'CG::EventType::RIGHT_MOUSE_UP'" do
      allow(mouse).to receive(:trigger)
      right_mouse_up
      expect(mouse).to have_received(:trigger).with(
        type: MacOS::CG::EventType::RIGHT_MOUSE_UP,
        x: x,
        y: y,
        button: MacOS::CG::MouseButton::RIGHT
      )
    end
  end

  describe '#right_mouse_click' do
    subject(:right_mouse_click) { mouse.right_mouse_click(x: x, y: y) }

    it "uses 'right_mouse_down' and 'right_mouse_up'" do
      allow(mouse).to receive(:right_mouse_down)
      allow(mouse).to receive(:right_mouse_up)
      right_mouse_click
      expect(mouse).to have_received(:right_mouse_down).with(x: x, y: y)
      expect(mouse).to have_received(:right_mouse_up).with(x: x, y: y)
    end
  end

  describe '#middle_mouse_down' do
    subject(:middle_mouse_down) { mouse.middle_mouse_down(x: x, y: y) }

    it "uses 'trigger' with 'CG::EventType::middle_MOUSE_DOWN'" do
      allow(mouse).to receive(:trigger)
      middle_mouse_down
      expect(mouse).to have_received(:trigger).with(
        type: MacOS::CG::EventType::OTHER_MOUSE_DOWN,
        x: x,
        y: y,
        button: MacOS::CG::MouseButton::CENTER
      )
    end
  end

  describe '#middle_mouse_up' do
    subject(:middle_mouse_up) { mouse.middle_mouse_up(x: x, y: y) }

    it "uses 'trigger' with 'CG::EventType::middle_MOUSE_UP'" do
      allow(mouse).to receive(:trigger)
      middle_mouse_up
      expect(mouse).to have_received(:trigger).with(
        type: MacOS::CG::EventType::OTHER_MOUSE_UP,
        x: x,
        y: y,
        button: MacOS::CG::MouseButton::CENTER
      )
    end
  end

  describe '#middle_mouse_click' do
    subject(:middle_mouse_click) { mouse.middle_mouse_click(x: x, y: y) }

    it "uses 'middle_mouse_down' and 'middle_mouse_up'" do
      allow(mouse).to receive(:middle_mouse_down)
      allow(mouse).to receive(:middle_mouse_up)
      middle_mouse_click
      expect(mouse).to have_received(:middle_mouse_down).with(x: x, y: y)
      expect(mouse).to have_received(:middle_mouse_up).with(x: x, y: y)
    end
  end
end
