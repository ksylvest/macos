# frozen_string_literal: true

require 'ffi'

module MacOS
  # https://developer.apple.com/documentation/coregraphics
  module Library
    extend ::FFI::Library
    ffi_lib '/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics'

    attach_function :CGEventCreate, %i[pointer], :pointer
    attach_function :CGEventGetLocation, %i[pointer], CG::Point.by_value
    attach_function :CFRelease, %i[pointer], :void
    attach_function :CGEventCreateMouseEvent, [:pointer, :uint32, CG::Point.by_value, :uint32], :pointer
    attach_function :CGEventPost, %i[uint32 pointer], :void
    attach_function :CGWarpMouseCursorPosition, [CG::Point.by_value], :pointer
  end
end
