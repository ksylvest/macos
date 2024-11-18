# frozen_string_literal: true

module MacOS
  # Simulates a macOS keyboard.
  class Keyboard
    MILISECOND = 0.001

    # @param text [String]
    def type(text)
      text.chars.each do |character|
        mask = 0
        mask |= Library::CoreGraphics::EventFlags::MASK_SHIFT if Library::CoreGraphics::KeyCode.shifted?(character)
        key(character, mask:)
      end
    end

    # @example
    #   keyboard.keys("a")
    #   keyboard.keys("b")
    #   keyboard.keys("c")
    #   keyboard.keys("command+shift+s")
    #   keyboard.keys("comand+shift+tab")
    #
    # @param text [String] e.g. "a", "b", "command+shift+s" or ""
    def keys(text)
      mask = 0
      options = text.split("+")
      key = options.pop

      options.each do |option|
        mask |= Library::CoreGraphics::EventFlags.find(option)
      end

      key(key.downcase, mask:)
    end

    # @example
    #   keyboard.key("s", mask: Library::CoreGraphics::EventFlags::MASK_COMMAND)
    #
    # @param character [String] a character to be pressed then released
    # @param mask [Integer] a bitmask of event flags  (e.g. Library::CoreGraphics::EventFlags::MASK_SHIFT)
    def key(character, mask: 0)
      key_down(character, mask:)
      key_up(character, mask:)
    end

    # @example
    #   keyboard.key_down("c", mask: Library::CoreGraphics::EventFlags::MASK_COMMAND)
    #
    # @param character [String] a character to be typed
    # @param mask [Integer] a bitmask of event flags (e.g. Library::CoreGraphics::EventFlags::MASK_SHIFT)
    def key_down(character, mask: 0)
      code = Library::CoreGraphics::KeyCode.find(character)
      event = Library::CoreGraphics.CGEventCreateKeyboardEvent(nil, code, true)
      Library::CoreGraphics.CGEventSetFlags(event, mask) unless mask.zero?
      Library::CoreGraphics.CGEventPost(Library::CoreGraphics::EventTapLocation::HID_EVENT_TAP, event)
      Library::CoreGraphics.CFRelease(event)
      sleep(MILISECOND)
    end

    # @example
    #   keyboard.key_up("c", mask: Library::CoreGraphics::EventFlags::MASK_COMMAND)
    #
    # @param character [String] a character to be released
    # @param mask [Integer] a bitmask of event flags (e.g. Library::CoreGraphics::EventFlags::MASK_SHIFT)
    def key_up(character, mask: 0)
      code = Library::CoreGraphics::KeyCode.find(character)
      event = Library::CoreGraphics.CGEventCreateKeyboardEvent(nil, code, false)
      Library::CoreGraphics.CGEventSetFlags(event, mask) unless mask.zero?
      Library::CoreGraphics.CGEventPost(Library::CoreGraphics::EventTapLocation::HID_EVENT_TAP, event)
      Library::CoreGraphics.CFRelease(event)
      sleep(MILISECOND)
    end
  end
end
