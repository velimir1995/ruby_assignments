class RotCypher
  LETTERS_ARRAY = ("a".."z").to_a.freeze
  UPPER_LETTERS_ARRAY = ("A".."Z").to_a.freeze

  def encrypt(message_to_encrypt, shift_key)
    encrypted_message = ""
    message_to_encrypt.split('').each do |unencrypted_letter|
      if unencrypted_letter == " "
        encrypted_message += " "
        next
      end
      index_to_encrypt = prepare_encryption_index(unencrypted_letter, shift_key)
      encrypted_message += letter_encryption(index_to_encrypt, upcase_letter?(unencrypted_letter))
    end
    encrypted_message
  end

  def letter_encryption(encrypted_letter_index, is_upcase)
    if is_upcase
      UPPER_LETTERS_ARRAY[encrypted_letter_index]
    else
      LETTERS_ARRAY[encrypted_letter_index]
    end
  end

  def prepare_encryption_index(letter_to_encrypt, shift_step)
    prepared_index_to_encrypt = LETTERS_ARRAY.find_index(letter_to_encrypt.downcase) + shift_step
    prepared_index_to_encrypt = fix_index_out_of_bounds(prepared_index_to_encrypt)
  end

  def fix_index_out_of_bounds(index_to_fix)
    fixed_index_to_encrypt = index_to_fix
    if index_to_fix >= LETTERS_ARRAY.length()
      fixed_index_to_encrypt -= LETTERS_ARRAY.length()
    end
    fixed_index_to_encrypt
  end

  def upcase_letter?(letter_to_encrypt)
    if letter_to_encrypt.upcase == letter_to_encrypt
      true
    else
      false
    end
  end
end
