class Shortener
  MIN_SLUG_LENGTH = 5


  def self.generate(id)
    retries ||= 5
    slug = Base58.encode(id)
    slug = ensure_min_length(slug, id)
    BadWord.check(slug)
  rescue BadWordException => e
    retry if (retries -= 1).nonzero?
    raise e
  else
    slug
  end

  private
  def self.ensure_min_length(slug, id)
    while slug.length < MIN_SLUG_LENGTH
      slug = "#{Base58::CHARS.sample}#{slug}"
    end
    slug
  end

end