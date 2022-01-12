class Rot_cypher 
    Letters_array = ("a".."z").to_a
    Upper_letters_array = ("A".."Z").to_a
    def rot13(input)
        value_to_return = ""
        input.split('').each{ |a|
            if(a == " ")
                value_to_return += " "
            else    
                if Upper_letters_array.include? a
                    index = Upper_letters_array.find_index(a)<13 ? (Upper_letters_array.find_index(a) +13) : (Upper_letters_array.find_index(a) -13)
                    value_to_return += Upper_letters_array[index]              
                else
                    index = Letters_array.find_index(a)<13 ? (Letters_array.find_index(a) +13) : (Letters_array.find_index(a) -13)
                    value_to_return += Letters_array[index] 
                end
            end
        }
        value_to_return
    end
    def rot0(input)
        value_to_return = ""
        input.split('').each{ |a|
            if(a == " ")
                value_to_return += " "
            else    
                if Upper_letters_array.include? a
                    index = Upper_letters_array.find_index(a)+0
                    value_to_return += Upper_letters_array[index]              
                else
                    index = Letters_array.find_index(a)+0
                    value_to_return += Letters_array[index] 
                end
            end
        }
        value_to_return
    end
    def rot26(input)
        value_to_return = ""
        input.split('').each{ |a|
            if(a == " ")
                value_to_return += " "
            else    
                if Upper_letters_array.include? a
                    index = Upper_letters_array.find_index(a)+25-25
                    value_to_return += Upper_letters_array[index]              
                else
                    index = Letters_array.find_index(a)+25-25
                    value_to_return += Letters_array[index] 
                end
            end
        }
        value_to_return
    end
    def rot5(input)
        value_to_return = ""
        input.split('').each{ |a|
            if(a == " ")
                value_to_return += " "
            else    
                if Upper_letters_array.include? a
                    index = Upper_letters_array.find_index(a)<21 ? (Upper_letters_array.find_index(a) +5) : (Upper_letters_array.find_index(a) -21)
                    value_to_return += Upper_letters_array[index]              
                else
                    index = Letters_array.find_index(a)<21 ? (Letters_array.find_index(a) +5) : (Letters_array.find_index(a) -21)
                    value_to_return += Letters_array[index] 
                end 
            end
        }
        value_to_return
    end
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
