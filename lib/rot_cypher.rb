class RotCypher
  attr_accessor :shift_key

  LETTERS_ARRAY = ("a".."z").to_a.freeze
  @letter
  @shift_key

  def initialize(shift_key)
    @shift_key = shift_key
  end

  def encrypt(message_to_encrypt)
    encrypted_message = ""
    message_to_encrypt.each_char do |unencrypted_letter|
      if  unencrypted_letter  == " "
        encrypted_message +=" "
        next
      end
      @letter = unencrypted_letter
      encrypted_message += encrypt_letter
    end
    encrypted_message
  end

  private

  def prepare_encryption_index
    encrypted_index = LETTERS_ARRAY.find_index(@letter.downcase) + @shift_key
    inbound_index?(encrypted_index) ? encrypted_index : encrypted_index - LETTERS_ARRAY.length()
  end

  def inbound_index?(index_to_check)
    index_to_check < LETTERS_ARRAY.length()
  end

  def encrypt_letter
    encrypted_letter_index = prepare_encryption_index
    if LETTERS_ARRAY.include?(@letter)
      LETTERS_ARRAY[encrypted_letter_index]
    else
      LETTERS_ARRAY[encrypted_letter_index].upcase
    end
  end

end
