# frozen_string_literal: true

module MacOS
  # Simulates a macOS mouse.
  class Mouse
    Position = Data.define(:x, :y)

    # @return [Position]
    def position
      event = Library::CoreGraphics.CGEventCreate(nil)
      position = Library::CoreGraphics.CGEventGetLocation(event)
      Library::CoreGraphics.CFRelease(event)

      x = position[:x]
      y = position[:y]

      Position.new(x, y)
    end

    # @param type [Integer] e.g. `MacOS::Library::CoreGraphicsEventType::MOUSE_MOVED`
    # @param x [Integer]
    # @param y [Integer]
    # @param button [Integer] e.g. `MacOS::Library::CoreGraphicsMouseButton::MIDDLE`
    def trigger(type:, x:, y:, button: 0)
      position = Library::CoreGraphics::CGPoint.new
      position[:x] = x
      position[:y] = y

      event = Library::CoreGraphics.CGEventCreateMouseEvent(nil, type, position, button)

      Library::CoreGraphics.CGEventPost(Library::CoreGraphics::EventTapLocation::HID_EVENT_TAP, event)
      Library::CoreGraphics.CFRelease(event)
    end

    # @param x [Integer]
    # @param y [Integer]
    def move(x:, y:)
      position = Library::CoreGraphics::CGPoint.new
      position[:x] = x
      position[:y] = y
      Library::CoreGraphics.CGWarpMouseCursorPosition(position)
    end

    # @param x [Integer]
    # @param y [Integer]
    def left_down(x:, y:)
      trigger(x:, y:,
        type: Library::CoreGraphics::EventType::LEFT_MOUSE_DOWN,
        button: Library::CoreGraphics::MouseButton::LEFT)
    end

    # @param x [Integer]
    # @param y [Integer]
    def left_up(x:, y:)
      trigger(x:, y:,
        type: Library::CoreGraphics::EventType::LEFT_MOUSE_UP,
        button: Library::CoreGraphics::MouseButton::LEFT)
    end

    # @param x [Integer]
    # @param y [Integer]
    def left_click(x:, y:)
      left_down(x:, y:)
      left_up(x:, y:)
    end

    # @param x [Integer]
    # @param y [Integer]
    def right_down(x:, y:)
      trigger(x:, y:,
        type: Library::CoreGraphics::EventType::RIGHT_MOUSE_DOWN,
        button: Library::CoreGraphics::MouseButton::RIGHT)
    end

    # @param x [Integer]
    # @param y [Integer]
    def right_up(x:, y:)
      trigger(x:, y:,
        type: Library::CoreGraphics::EventType::RIGHT_MOUSE_UP,
        button: Library::CoreGraphics::MouseButton::RIGHT)
    end

    # @param x [Integer]
    # @param y [Integer]
    def right_click(x:, y:)
      right_down(x:, y:)
      right_up(x:, y:)
    end

    # @param x [Integer]
    # @param y [Integer]
    def middle_down(x:, y:)
      trigger(x:, y:,
        type: Library::CoreGraphics::EventType::OTHER_MOUSE_DOWN,
        button: Library::CoreGraphics::MouseButton::CENTER)
    end

    # @param x [Integer]
    # @param y [Integer]
    def middle_up(x:, y:)
      trigger(x:, y:,
        type: Library::CoreGraphics::EventType::OTHER_MOUSE_UP,
        button: Library::CoreGraphics::MouseButton::CENTER)
    end

    # @param x [Integer]
    # @param y [Integer]
    def middle_click(x:, y:)
      middle_down(x:, y:)
      middle_up(x:, y:)
    end
  end
end
