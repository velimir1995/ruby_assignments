class Rot_cypher 
    #@letters_array = ("a".."z").to_a -- ovo je bilo gresno
    def initialize #ovo dok nisam dodao namucih se
        @letters_array = ("a".."z").to_a
    end
    def rot13(input)
        value_to_return = ""
        input.split('').each{ |a|
            if(a == " ")
                value_to_return += " "
            else    
                index = @letters_array.find_index(a)<13 ? (@letters_array.find_index(a) +13) : (@letters_array.find_index(a) -13)
                value_to_return += @letters_array[index] 
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
                index = @letters_array.find_index(a)+0
                value_to_return += @letters_array[index] 
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
                index = @letters_array.find_index(a)+25-25
                value_to_return += @letters_array[index] 
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
                index = @letters_array.find_index(a)<21 ? (@letters_array.find_index(a) + 5) : (@letters_array.find_index(a)-21)
                value_to_return += @letters_array[index] 
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
                index = @letters_array.find_index(a)<26-shift_key ? (@letters_array.find_index(a) + shift_key) : (@letters_array.find_index(a)-26+shift_key)
                value_to_return += @letters_array[index] 
            end
        }
        value_to_return
    end
end