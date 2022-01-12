class RotCypher 
    Letters_array = ("a".."z").to_a
    Upper_letters_array = ("A".."Z").to_a

    def universal(message_to_encrypt, shift_key)
        encrypted_message = ""
        message_to_encrypt.split('').each { |a|
            if(a == " ")
                encrypted_message += " "
            else    
                if Upper_letters_array.include? a
                    index = Upper_letters_array.find_index(a)<26-shift_key ? (Upper_letters_array.find_index(a) + shift_key) : (Upper_letters_array.find_index(a)-26+shift_key)
                    encrypted_message += Upper_letters_array[index]             
                else
                    index = Letters_array.find_index(a)<26-shift_key ? (Letters_array.find_index(a) + shift_key) : (Letters_array.find_index(a)-26+shift_key)
                    encrypted_message += Letters_array[index] 
                end 

            end
        }
        encrypted_message
    end
end
