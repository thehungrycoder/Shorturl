class BadWord
  #TODO populate this with a comprehensive list of bad words, possibly with a third party service
  #TODO match partially
  BAD_WORDS = %w['foo, bar']

  def self.check(word)
    if BAD_WORDS.include? word
      raise BadWordException
    end
  end
end