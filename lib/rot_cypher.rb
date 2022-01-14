class RotCypher
  LETTERS_ARRAY = ("a".."z").to_a.freeze
  UPPER_LETTERS_ARRAY = ("A".."Z").to_a.freeze

  def encrypt(message_to_encrypt, shift_key)
    encrypted_message = ""
    message_to_encrypt.split('').each do |letter_to_encrypt|
      if(letter_to_encrypt == " ")
        encrypted_message += " "
      else
        index_of_unencrypted_letter = UPPER_LETTERS_ARRAY.find_index(letter_to_encrypt.upcase)
        index_of_encrypted_letter = if(index_of_unencrypted_letter < 26 - shift_key)
                  (index_of_unencrypted_letter + shift_key)
                else
                  (index_of_unencrypted_letter + shift_key - 26)
                end
        if UPPER_LETTERS_ARRAY.include? letter_to_encrypt
          encrypted_message += UPPER_LETTERS_ARRAY[index_of_encrypted_letter]
        else
          encrypted_message += LETTERS_ARRAY[index_of_encrypted_letter]
        end
      end
    end
    encrypted_message
  end
end
