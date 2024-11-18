# frozen_string_literal: true

module MacOS
  module Library
    module CoreGraphics
      # https://developer.apple.com/documentation/coregraphics/cgkeycode
      module KeyCode
        SHIFTED = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+{}|:\"<>?~`"

        KEY_CODE_A = 0
        KEY_CODE_B = 11
        KEY_CODE_C = 8
        KEY_CODE_D = 2
        KEY_CODE_E = 14
        KEY_CODE_F = 3
        KEY_CODE_G = 5
        KEY_CODE_H = 4
        KEY_CODE_I = 34
        KEY_CODE_J = 38
        KEY_CODE_K = 40
        KEY_CODE_L = 37
        KEY_CODE_M = 46
        KEY_CODE_N = 45
        KEY_CODE_O = 31
        KEY_CODE_P = 35
        KEY_CODE_Q = 12
        KEY_CODE_R = 15
        KEY_CODE_S = 1
        KEY_CODE_T = 17
        KEY_CODE_U = 32
        KEY_CODE_V = 9
        KEY_CODE_W = 13
        KEY_CODE_X = 7
        KEY_CODE_Y = 16
        KEY_CODE_Z = 6

        KEY_CODE_0 = 29
        KEY_CODE_1 = 18
        KEY_CODE_2 = 19
        KEY_CODE_3 = 20
        KEY_CODE_4 = 21
        KEY_CODE_5 = 23
        KEY_CODE_6 = 22
        KEY_CODE_7 = 26
        KEY_CODE_8 = 28
        KEY_CODE_9 = 25

        KEY_CODE_TILDE = 30
        KEY_CODE_BACKTICK = 30

        KEY_CODE_EXCLAMATION = 18
        KEY_CODE_AMPERSAT = 19
        KEY_CODE_HASH = 20
        KEY_CODE_DOLLAR = 21
        KEY_CODE_PERCENT = 23
        KEY_CODE_CARET = 22
        KEY_CODE_AMPERSAND = 26
        KEY_CODE_ASTERISK = 28
        KEY_CODE_LPARENTHESIS = 25
        KEY_CODE_RPARENTHESIS = 29
        KEY_CODE_MINUS = 27
        KEY_CODE_UNDERSCORE = 27
        KEY_CODE_EQUAL = 24
        KEY_CODE_PLUS = 24

        KEY_CODE_LBRACKET = 33
        KEY_CODE_RBRACKET = 30
        KEY_CODE_BACKSLASH = 42
        KEY_CODE_SEMICOLON = 41
        KEY_CODE_LBRACE = 33
        KEY_CODE_RBRACE = 30
        KEY_CODE_PIPE = 42
        KEY_CODE_COLON = 41
        KEY_CODE_QUOTE = 39
        KEY_CODE_QUOTATION = 39
        KEY_CODE_COMMA = 43
        KEY_CODE_PERIOD = 47
        KEY_CODE_SLASH = 44
        KEY_CODE_LT = 43
        KEY_CODE_GT = 47
        KEY_CODE_TAB = 48
        KEY_CODE_ESCAPE = 53
        KEY_CODE_RETURN = 36
        KEY_CODE_DELETE = 51
        KEY_CODE_SPACE = 49
        KEY_CODE_LEFT = 123
        KEY_CODE_RIGHT = 124
        KEY_CODE_DOWN = 125
        KEY_CODE_UP = 126
        KEY_CODE_SHIFT = 56
        KEY_CODE_CONTROL = 59
        KEY_CODE_OPTION = 58
        KEY_CODE_COMMAND = 55
        KEY_CODE_FUNCTION = 63

        MAPPING = {
          "a" => KEY_CODE_A,
          "A" => KEY_CODE_A,
          "b" => KEY_CODE_B,
          "B" => KEY_CODE_B,
          "c" => KEY_CODE_C,
          "C" => KEY_CODE_C,
          "d" => KEY_CODE_D,
          "D" => KEY_CODE_D,
          "e" => KEY_CODE_E,
          "E" => KEY_CODE_E,
          "f" => KEY_CODE_F,
          "F" => KEY_CODE_F,
          "g" => KEY_CODE_G,
          "G" => KEY_CODE_G,
          "h" => KEY_CODE_H,
          "H" => KEY_CODE_H,
          "i" => KEY_CODE_I,
          "I" => KEY_CODE_I,
          "j" => KEY_CODE_J,
          "J" => KEY_CODE_J,
          "k" => KEY_CODE_K,
          "K" => KEY_CODE_K,
          "l" => KEY_CODE_L,
          "L" => KEY_CODE_L,
          "m" => KEY_CODE_M,
          "M" => KEY_CODE_M,
          "n" => KEY_CODE_N,
          "N" => KEY_CODE_N,
          "o" => KEY_CODE_O,
          "O" => KEY_CODE_O,
          "p" => KEY_CODE_P,
          "P" => KEY_CODE_P,
          "q" => KEY_CODE_Q,
          "Q" => KEY_CODE_Q,
          "r" => KEY_CODE_R,
          "R" => KEY_CODE_R,
          "s" => KEY_CODE_S,
          "S" => KEY_CODE_S,
          "t" => KEY_CODE_T,
          "T" => KEY_CODE_T,
          "u" => KEY_CODE_U,
          "U" => KEY_CODE_U,
          "v" => KEY_CODE_V,
          "V" => KEY_CODE_V,
          "w" => KEY_CODE_W,
          "W" => KEY_CODE_W,
          "x" => KEY_CODE_X,
          "X" => KEY_CODE_X,
          "y" => KEY_CODE_Y,
          "Y" => KEY_CODE_Y,
          "z" => KEY_CODE_Z,
          "Z" => KEY_CODE_Z,
          "1" => KEY_CODE_1,
          "2" => KEY_CODE_2,
          "3" => KEY_CODE_3,
          "4" => KEY_CODE_4,
          "5" => KEY_CODE_5,
          "6" => KEY_CODE_6,
          "7" => KEY_CODE_7,
          "8" => KEY_CODE_8,
          "9" => KEY_CODE_9,
          "0" => KEY_CODE_0,
          "~" => KEY_CODE_TILDE,
          "`" => KEY_CODE_BACKTICK,
          "!" => KEY_CODE_EXCLAMATION,
          "@" => KEY_CODE_AMPERSAT,
          "#" => KEY_CODE_HASH,
          "$" => KEY_CODE_DOLLAR,
          "%" => KEY_CODE_PERCENT,
          "^" => KEY_CODE_CARET,
          "&" => KEY_CODE_AMPERSAND,
          "*" => KEY_CODE_ASTERISK,
          "(" => KEY_CODE_LPARENTHESIS,
          ")" => KEY_CODE_RPARENTHESIS,
          "=" => KEY_CODE_EQUAL,
          "-" => KEY_CODE_MINUS,
          "+" => KEY_CODE_PLUS,
          "_" => KEY_CODE_UNDERSCORE,
          "[" => KEY_CODE_LBRACKET,
          "]" => KEY_CODE_RBRACKET,
          "<" => KEY_CODE_LT,
          ">" => KEY_CODE_GT,
          "{" => KEY_CODE_LBRACE,
          "}" => KEY_CODE_RBRACE,
          "|" => KEY_CODE_PIPE,
          ":" => KEY_CODE_COLON,
          "'" => KEY_CODE_QUOTE,
          "\"" => KEY_CODE_QUOTATION,
          "," => KEY_CODE_COMMA,
          "." => KEY_CODE_PERIOD,
          "/" => KEY_CODE_SLASH,
          "\\" => KEY_CODE_BACKSLASH,
          "space" => KEY_CODE_SPACE,
          " " => KEY_CODE_SPACE,
          "escape" => KEY_CODE_ESCAPE,
          "backspace" => KEY_CODE_DELETE,
          "delete" => KEY_CODE_DELETE,
          "command" => KEY_CODE_COMMAND,
          "cmd" => KEY_CODE_COMMAND,
          "⌘" => KEY_CODE_COMMAND,
          "option" => KEY_CODE_OPTION,
          "control" => KEY_CODE_CONTROL,
          "shift" => KEY_CODE_SHIFT,
          "function" => KEY_CODE_FUNCTION,
          "left" => KEY_CODE_LEFT,
          "right" => KEY_CODE_RIGHT,
          "up" => KEY_CODE_UP,
          "down" => KEY_CODE_DOWN,
          "←" => KEY_CODE_LEFT,
          "→" => KEY_CODE_RIGHT,
          "↑" => KEY_CODE_UP,
          "↓" => KEY_CODE_DOWN,
          "tab" => KEY_CODE_TAB,
          "\t" => KEY_CODE_TAB,
          "return" => KEY_CODE_RETURN,
          "enter" => KEY_CODE_RETURN,
          "\n" => KEY_CODE_RETURN,
        }.freeze

        # @param key [String]
        # @raise [ArgumentError]
        #
        # @return [Integer]
        def self.find(key)
          MAPPING[key] || raise(ArgumentError, "unsupported key=#{key.inspect}")
        end

        # @param key [String]
        #
        # @return [Boolean]
        def self.shifted?(key)
          SHIFTED.include?(key)
        end
      end
    end
  end
end
