# frozen_string_literal: true

module MacOS
  # Simulates a macOS mouse.
  class Mouse
    Position = Data.define(:x, :y)

    # @return [Position]
    def position
      event = Library.CGEventCreate(nil)
      position = Library.CGEventGetLocation(event)
      Library.CFRelease(event)

      x = position[:x]
      y = position[:y]

      Position.new(x, y)
    end

    # @param type [Integer] e.g. `MacOS::CG::EventType::MOUSE_MOVED`
    # @param x [Float]
    # @param y [Float]
    # @param button [Integer] e.g. `MacOS::CG::MouseButton::LEFT` / `MacOS::CG::MouseButton::RIGHT` / etc.
    def trigger(type:, x:, y:, button: 0)
      position = CG::Point.new
      position[:x] = x
      position[:y] = y
      event = Library.CGEventCreateMouseEvent(nil, type, position, button)
      Library.CGEventPost(CG::EventTapLocation::HID_EVENT_TAP, event)
      Library.CFRelease(event)
    end

    # @param x [Float]
    # @param y [Float]
    def move(x:, y:)
      position = CG::Point.new
      position[:x] = x
      position[:y] = y
      Library.CGWarpMouseCursorPosition(position)
    end

    # @param x [Float]
    # @param y [Float]
    def left_down(x:, y:)
      trigger(type: CG::EventType::LEFT_MOUSE_DOWN, x:, y:, button: CG::MouseButton::LEFT)
    end

    # @param x [Float]
    # @param y [Float]
    def left_up(x:, y:)
      trigger(type: CG::EventType::LEFT_MOUSE_UP, x:, y:, button: CG::MouseButton::LEFT)
    end

    # @param x [Float]
    # @param y [Float]
    def left_click(x:, y:)
      left_down(x:, y:)
      left_up(x:, y:)
    end

    # @param x [Float]
    # @param y [Float]
    def right_down(x:, y:)
      trigger(type: CG::EventType::RIGHT_MOUSE_DOWN, x:, y:, button: CG::MouseButton::RIGHT)
    end

    # @param x [Float]
    # @param y [Float]
    def right_up(x:, y:)
      trigger(type: CG::EventType::RIGHT_MOUSE_UP, x:, y:, button: CG::MouseButton::RIGHT)
    end

    # @param x [Float]
    # @param y [Float]
    def right_click(x:, y:)
      right_down(x:, y:)
      right_up(x:, y:)
    end

    # @param x [Float]
    # @param y [Float]
    def middle_down(x:, y:)
      trigger(type: CG::EventType::OTHER_MOUSE_DOWN, x:, y:, button: CG::MouseButton::CENTER)
    end

    # @param x [Float]
    # @param y [Float]
    def middle_up(x:, y:)
      trigger(type: CG::EventType::OTHER_MOUSE_UP, x:, y:, button: CG::MouseButton::CENTER)
    end

    # @param x [Float]
    # @param y [Float]
    def middle_click(x:, y:)
      middle_down(x:, y:)
      middle_up(x:, y:)
    end
  end
end
