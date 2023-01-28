module UrlsHelper
  ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
  # In order to avoid having an url that will conflict with the routing
  INVALID_URLS = ['urls']

  def self.bijective_encode(i)
    # from http://refactormycode.com/codes/125-base-62-encoding
    # with only minor modification
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0 || INVALID_URLS.include? s
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end
  
  def self.bijective_decode(s)
    # based on base2dec() in Tcl translation 
    # at http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end
end
