class RotCypher 
  Letters_array = ("a".."z").to_a
  Upper_letters_array = ("A".."Z").to_a

  def encrypt(message_to_encrypt, shift_key)
    encrypted_message = ""
    message_to_encrypt.split('').each do |letter_to_encrypt| 
      if(letter_to_encrypt == " ")
        encrypted_message += " "
      else  
        if Upper_letters_array.include? letter_to_encrypt
          index = if(Upper_letters_array.find_index(letter_to_encrypt)<26-shift_key)
                    (Upper_letters_array.find_index(letter_to_encrypt) + shift_key)
                  else
                    (Upper_letters_array.find_index(letter_to_encrypt)-26+shift_key)
                  end  
          encrypted_message += Upper_letters_array[index]
        else
          index = if(Letters_array.find_index(letter_to_encrypt)<26-shift_key)
                    (Letters_array.find_index(letter_to_encrypt) + shift_key)
                  else
                    (Letters_array.find_index(letter_to_encrypt)-26+shift_key)
                  end 
          encrypted_message += Letters_array[index]
        end 
      end
    end
    encrypted_message
  end
end
