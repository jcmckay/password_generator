class PasswordGenerator
  class << self
    def password(size: 15, ltr_count: 2, num_count: 2, capital_count: 2, special_count: 2)
      
      caps = get_random(capital_count, capitals)
      spc  = get_random(special_count, specials)
      ltrs = get_random(ltr_count,     letters)
      nums = get_random(num_count,     numbers)
  
      chars = (caps + spc + ltrs + nums) + shuffled_chars[0..7]
      chars.shuffle.join
    end

    private 

    def capitals
      ("A".."Z").to_a
    end

    def specials
      ["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?"]
    end

    def letters
      ("a".."z").to_a
    end

    def numbers 
      (0..9).to_a
    end

    def shuffled_chars
      (letters + capitals + specials).shuffle
    end

    def get_random(count, array)
      result = []
      count.times do
        index = Random.new.rand(0..array.length)
        result << array[index]
      end
      result
    end
  end
end



# letters a-z
# letters A-Z
# numbers 0-9
# special chars (optional)

letters   = ("a".."z").to_a
capitals  = ("A".."Z").to_a
specials  = ('!'..'?').to_a #this does numbers too
password_length = ARGV[0].to_i > 0 ? ARGV[0].to_i - 1 : 12

password = (letters + capitals + specials).shuffle[0..password_length]

puts password.join

puts 'second password'

puts PasswordGenerator.password

