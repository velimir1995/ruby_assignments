class Rot_cypher 
    Letters_array = ("a".."z").to_a
    Upper_letters_array = ("A".."Z").to_a

    def universal(input, shift_key)
        value_to_return = ""
        input.split('').each{ |a|
            if(a == " ")
                value_to_return += " "
            else    
                if Upper_letters_array.include? a
                    index = Upper_letters_array.find_index(a)<26-shift_key ? (Upper_letters_array.find_index(a) + shift_key) : (Upper_letters_array.find_index(a)-26+shift_key)
                    value_to_return += Upper_letters_array[index]             
                else
                    index = Letters_array.find_index(a)<26-shift_key ? (Letters_array.find_index(a) + shift_key) : (Letters_array.find_index(a)-26+shift_key)
                    value_to_return += Letters_array[index] 
                end 

            end
        }
        value_to_return
    end
end
