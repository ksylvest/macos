# frozen_string_literal: true

module MacOS
  module CG
    # https://developer.apple.com/documentation/coregraphics/cgeventtype
    module EventType
      NULL = 0 # https://developer.apple.com/documentation/coregraphics/cgeventtype/null
      LEFT_MOUSE_DOWN = 1 # https://developer.apple.com/documentation/coregraphics/cgeventtype/leftmousedown
      LEFT_MOUSE_UP = 2 # https://developer.apple.com/documentation/coregraphics/cgeventtype/leftmouseup
      RIGHT_MOUSE_DOWN = 3 # https://developer.apple.com/documentation/coregraphics/cgeventtype/rightmousedown
      RIGHT_MOUSE_UP = 4 # https://developer.apple.com/documentation/coregraphics/cgeventtype/rightmouseup
      MOUSE_MOVED = 5 # https://developer.apple.com/documentation/coregraphics/cgeventtype/mousemoved
      LEFT_MOUSE_DRAGGED = 6 # https://developer.apple.com/documentation/coregraphics/cgeventtype/leftmousedragged
      RIGHT_MOUSE_DRAGGED = 7 # https://developer.apple.com/documentation/coregraphics/cgeventtype/rightmousedragged
      KEY_DOWN = 10 # https://developer.apple.com/documentation/coregraphics/cgeventtype/keydown
      KEY_UP = 11 # https://developer.apple.com/documentation/coregraphics/cgeventtype/keyup
      OTHER_MOUSE_DOWN = 25 # https://developer.apple.com/documentation/coregraphics/cgeventtype/othermousedown
      OTHER_MOUSE_UP = 26 # https://developer.apple.com/documentation/coregraphics/cgeventtype/othermouseup
      OTHER_MOUSE_DRAGGED = 27 # https://developer.apple.com/documentation/coregraphics/cgeventtype/othermousedragged
    end
  end
end
