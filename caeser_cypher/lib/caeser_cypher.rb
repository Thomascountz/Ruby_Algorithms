SMALL_Z = 122
BIG_Z = 90
CHRS_IN_ALPHABET = 26

def c_cypher(args = {})
  string = args.fetch(:string, nil)
  index = args.fetch(:index, nil)

  string = string.split('').map! do |character|
    if character =~ /[a-zA-z]/
      
      if character =~ /[a-z]/ && character.ord + index > SMALL_Z
        ((character.ord + index) - CHRS_IN_ALPHABET).chr
      elsif character =~ /[A-Z]/ && character.ord + index > BIG_Z
        ((character.ord + index) - CHRS_IN_ALPHABET).chr
      else
        (character.ord + index).chr
      end
      
    else
      character
    end
  end
  
  string.join
end
