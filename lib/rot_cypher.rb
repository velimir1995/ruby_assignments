class RotCypher
  LETTERS_ARRAY = ("a".."z").to_a.freeze
  UPPER_LETTERS_ARRAY = ("A".."Z").to_a.freeze
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
      encrypted_message += letter_encryption()
    end
    encrypted_message
  end

  def change_encryption_key(new_shift_key)
    @shift_key = new_shift_key
  end

private

  def prepare_encryption_index
    prepared_index_to_encrypt = LETTERS_ARRAY.find_index(@letter.downcase) + @shift_key
    prepared_index_to_encrypt = fix_index_out_of_bounds(prepared_index_to_encrypt)
  end

  def fix_index_out_of_bounds(index_to_fix)
    fixed_index_to_encrypt = index_to_fix
    if index_to_fix >= LETTERS_ARRAY.length()
      fixed_index_to_encrypt -= LETTERS_ARRAY.length()
    end
    fixed_index_to_encrypt
  end

  def letter_encryption()
    encrypted_letter_index = prepare_encryption_index
    if UPPER_LETTERS_ARRAY.include?(@letter)
      UPPER_LETTERS_ARRAY[encrypted_letter_index]
    else
      LETTERS_ARRAY[encrypted_letter_index]
    end
  end

end
