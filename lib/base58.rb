module Base58
  #@source A discussion from stackoverflow

  #list of possible chars without the mutually confusing alpahbets like 1, l, 0, O etc.
  CHARS = %w(2 3 4 5 6 7 8 9 a b c d e f g h i j k m n p q r s t u v w x y z A B C D E F G H J K L M N P Q R S T U V W X Y Z)

  def self.encode(n)
    return CHARS[0] if n == 0
    result = ''
    base = CHARS.length

    while n > 0
      remainder = n % base
      n = n / base
      result = CHARS[remainder] + result
    end
    result
  end
end