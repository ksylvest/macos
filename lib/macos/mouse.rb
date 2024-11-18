# frozen_string_literal: true

module MacOS
  # Simulates a macOS mouse.
  class Mouse
    Position = Data.define(:x, :y)

    # @return [Position]
    def position
      event = Library.CGEventCreate(nil)
      location = Library.CGEventGetLocation(event)
      Library.CFRelease(event)

      x = location.x
      y = location.y

      Position.new(x: x, y: y)
    end

    # @param type [Integer] e.g. `MacOS::CG::EventType::MOUSE_MOVED`
    # @param x [Float]
    # @param y [Float]
    # @param button [Integer] e.g. `MacOS::CG::MouseButton::LEFT` / `MacOS::CG::MouseButton::RIGHT` / etc.
    def trigger(type:, x:, y:, button: 0)
      position = CG::Point.new(x: x, y: y)
      event = Library.CGEventCreateMouseEvent(nil, type, position, button)
      Library.CGEventPost(CG::EventTapLocation::HID_EVENT_TAP, event)
      Library.CFRelease(event)
    end

    # @param x [Float]
    # @param y [Float]
    def move(x:, y:)
      position = CG::Point.new(x: x, y: y)
      Library.CGWarpMouseCursorPosition(position)
    end

    # @param x [Float]
    # @param y [Float]
    def left_mouse_down(x:, y:)
      trigger(type: CG::EventType::LEFT_MOUSE_DOWN, x: x, y: y, button: CG::MouseButton::LEFT)
    end

    # @param x [Float]
    # @param y [Float]
    def left_mouse_up(x:, y:)
      trigger(type: CG::EventType::LEFT_MOUSE_UP, x: x, y: y, button: CG::MouseButton::LEFT)
    end

    # @param x [Float]
    # @param y [Float]
    def left_mouse_click(x:, y:)
      left_mouse_down(x: x, y: y)
      left_mouse_up(x: x, y: y)
    end

    # @param x [Float]
    # @param y [Float]
    def right_mouse_down(x:, y:)
      trigger(type: CG::EventType::RIGHT_MOUSE_DOWN, x: x, y: y, button: CG::MouseButton::RIGHT)
    end

    # @param x [Float]
    # @param y [Float]
    def right_mouse_up(x:, y:)
      trigger(type: CG::EventType::RIGHT_MOUSE_UP, x: x, y: y, button: CG::MouseButton::RIGHT)
    end

    # @param x [Float]
    # @param y [Float]
    def right_mouse_click(x:, y:)
      right_mouse_down(x: x, y: y)
      right_mouse_up(x: x, y: y)
    end

    # @param x [Float]
    # @param y [Float]
    def middle_mouse_down(x:, y:)
      trigger(type: CG::EventType::OTHER_MOUSE_DOWN, x: x, y: y, button: CG::MouseButton::CENTER)
    end

    # @param x [Float]
    # @param y [Float]
    def middle_mouse_up(x:, y:)
      trigger(type: CG::EventType::OTHER_MOUSE_UP, x: x, y: y, button: CG::MouseButton::CENTER)
    end

    # @param x [Float]
    # @param y [Float]
    def middle_mouse_click(x:, y:)
      middle_mouse_down(x: x, y: y)
      middle_mouse_up(x: x, y: y)
    end
  end
end
