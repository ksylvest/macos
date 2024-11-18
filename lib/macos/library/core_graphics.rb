# frozen_string_literal: true

require "ffi"

module MacOS
  module Library
    # https://developer.apple.com/documentation/coregraphics
    module CoreGraphics
      extend ::FFI::Library
      ffi_lib "/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics"

      # https://developer.apple.com/documentation/corefoundation/cgpoint
      class CGPoint < FFI::Struct
        layout :x, :double, :y, :double
      end

      # https://developer.apple.com/documentation/corefoundation/cgsize
      class CGSize < FFI::Struct
        layout :width, :double, :height, :double
      end

      # https://developer.apple.com/documentation/corefoundation/cgrect
      class CGRect < FFI::Struct
        layout :origin, CGPoint, :size, CGSize
      end

      typedef :pointer, :CGError
      typedef :pointer, :CGEventRef
      typedef :pointer, :CGImageRef
      typedef :uint16, :CGKeyCode
      typedef :uint32, :CGDirectDisplayID
      typedef :uint32, :CGEventFlags
      typedef :uint32, :CGEventTapLocation
      typedef :uint32, :CGEventType
      typedef :uint32, :CGMouseButton

      attach_function :CFRelease, %i[pointer], :void
      attach_function :CGEventCreate, %i[pointer], :CGEventRef
      attach_function :CGEventGetLocation, %i[pointer], CGPoint.by_value
      attach_function :CGEventCreateMouseEvent, [:pointer, :CGEventType, CGPoint.by_value, :CGMouseButton], :CGEventRef
      attach_function :CGEventCreateKeyboardEvent, %i[pointer CGKeyCode bool], :CGEventRef
      attach_function :CGEventSetFlags, %i[CGEventRef CGEventFlags], :void
      attach_function :CGEventPost, %i[CGEventTapLocation CGEventRef], :void
      attach_function :CGWarpMouseCursorPosition, [CGPoint.by_value], :CGError
      attach_function :CGMainDisplayID, [], :CGDirectDisplayID
      attach_function :CGDisplayBounds, %i[CGDirectDisplayID], CGRect.by_value
      attach_function :CGDisplayCreateImage, %i[CGDirectDisplayID], :CGImageRef
      attach_function :CGDisplayPixelsWide, %i[CGDirectDisplayID], :size_t
      attach_function :CGDisplayPixelsHigh, %i[CGDirectDisplayID], :size_t
    end
  end
end
