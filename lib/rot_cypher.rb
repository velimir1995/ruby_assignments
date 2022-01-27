class RotCypher

  LETTERS_ARRAY = ("a".."z").to_a.freeze

  def initialize(shift_key)
    @shift_key = shift_key
  end

  def encrypt(message_to_encrypt)
    encrypted_message = ""
    message_to_encrypt.each_char do |raw_letter|
        encrypted_message << encrypt_letter(raw_letter)
    end
    encrypted_message
  end

  private

  def prepare_encryption_index(raw_letter)
    encrypted_index = LETTERS_ARRAY.find_index(raw_letter.downcase) + @shift_key
    inbound_index?(encrypted_index) ? encrypted_index : encrypted_index - LETTERS_ARRAY.length
  end

  def inbound_index?(index_to_check)
    index_to_check < LETTERS_ARRAY.length
  end

  def encrypt_letter(raw_letter)
    if encryptable_letter?(raw_letter)
      encrypted_letter = LETTERS_ARRAY[prepare_encryption_index(raw_letter)]
      downcase_letter?(raw_letter) ? encrypted_letter : encrypted_letter.upcase
    else
      raw_letter
    end
  end

  def encryptable_letter?(raw_letter)
    LETTERS_ARRAY.include?(raw_letter.downcase)
  end

  def downcase_letter?(raw_letter)
    LETTERS_ARRAY.include?(raw_letter)
  end

end
