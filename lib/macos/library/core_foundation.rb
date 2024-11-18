# frozen_string_literal: true

require "ffi"

module MacOS
  module Library
    # https://developer.apple.com/documentation/corefoundation
    module CoreFoundation
      extend ::FFI::Library
      ENCODING_UTF8 = 0x08000100

      ffi_lib "/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation"

      typedef :pointer, :CFStringRef
      typedef :long, :CFIndex
      typedef :CFIndex, :CFURLPathStyle

      attach_function :CFStringCreateWithCString, %i[pointer string int], :pointer
      attach_function :CFURLCreateWithFileSystemPath, %i[pointer CFStringRef CFURLPathStyle bool], :pointer
      attach_function :CFRelease, %i[pointer], :void
    end
  end
end
