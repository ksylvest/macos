# frozen_string_literal: true

RSpec.describe MacOS::Keyboard do
  let(:keyboard) { described_class.new }

  let(:cg_key_code) { MacOS::Library::CoreGraphics::KeyCode::KEY_CODE_EXCLAMATION }
  let(:cg_mask_shift) { MacOS::Library::CoreGraphics::EventFlags::MASK_SHIFT }
  let(:cg_hid_event_tap) { MacOS::Library::CoreGraphics::EventTapLocation::HID_EVENT_TAP }

  describe "#type" do
    let(:event) { double }

    it "uses 'CGEventGetLocation'" do
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventCreateKeyboardEvent) { event }
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventSetFlags)
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventPost)
      allow(MacOS::Library::CoreGraphics).to receive(:CFRelease)

      keyboard.type("!")

      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventCreateKeyboardEvent).with(nil, cg_key_code, true)
      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventCreateKeyboardEvent).with(nil, cg_key_code, false)
      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventSetFlags).with(event, cg_mask_shift).twice
      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventPost).with(cg_hid_event_tap, event).twice
      expect(MacOS::Library::CoreGraphics).to have_received(:CFRelease).with(event).twice
    end
  end

  describe "#keys" do
    let(:event) { double }

    it "sends a key event with the correct mask" do
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventCreateKeyboardEvent) { event }
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventSetFlags)
      allow(MacOS::Library::CoreGraphics).to receive(:CGEventPost)
      allow(MacOS::Library::CoreGraphics).to receive(:CFRelease)

      keyboard.keys("shift+!")

      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventCreateKeyboardEvent).with(nil, cg_key_code, true)
      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventCreateKeyboardEvent).with(nil, cg_key_code, false)
      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventSetFlags).with(event, cg_mask_shift).twice
      expect(MacOS::Library::CoreGraphics).to have_received(:CGEventPost).with(cg_hid_event_tap, event).twice
      expect(MacOS::Library::CoreGraphics).to have_received(:CFRelease).with(event).twice
    end
  end
end
