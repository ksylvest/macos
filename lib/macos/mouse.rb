# frozen_string_literal: true

module MacOS
  # Simulates a macOS mouse.
  class Mouse
    def position
      event = Library.CGEventCreate(nil)
      location = Library.CGEventGetLocation(event)
      Library.CFRelease(event)

      x = location[:x]
      y = location[:y]

      [x, y]
    end

    # @param type [Integer] e.g. `MacOS::CG::EventType::MOUSE_MOVED`
    # @param x [Float]
    # @param y [Float]
    # @param button [Integer] e.g. `MacOS::CG::MouseButton::LEFT` / `MacOS::CG::MouseButton::RIGHT` / etc.
    def trigger(type:, x:, y:, button: 0)
      position = MacOS::CG::Point.new
      position[:x] = x
      position[:y] = y
      source = Library.CGEventCreate(nil)
      Library.CGEventCreateMouseEvent(source, type, position, button)
      Library.CFRelease(source)
    end

    # @param x [Float]
    # @param y [Float]
    def move(x:, y:)
      trigger(type: CG::EventType::MOUSE_MOVED, x: x, y: y)
    end

    # @param x [Float]
    # @param y [Float]
    def left_mouse_down(x:, y:)
      trigger(type: CG::EventType::LEFT_MOUSE_DOWN, x: x, y: y)
    end

    # @param x [Float]
    # @param y [Float]
    def left_mouse_up(x:, y:)
      trigger(type: CG::EventType::LEFT_MOUSE_UP, x: x, y: y)
    end

    # @param x [Float]
    # @param y [Float]
    def right_mouse_down(x:, y:)
      trigger(type: CG::EventType::RIGHT_MOUSE_DOWN, x: x, y: y)
    end

    # @param x [Float]
    # @param y [Float]
    def right_mouse_up(x:, y:)
      trigger(type: CG::EventType::RIGHT_MOUSE_UP, x: x, y: y)
    end
  end
end
