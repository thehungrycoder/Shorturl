class UniqueTester

  def self.test
    keys = []
    100000.times do |idx|
      key = Shortener.generate(idx)
      keys.push key
      num_occurrences = keys.count(key)
      if  num_occurrences> 1
        puts "#{key} exists #{num_occurrences} times"
      end
    end
  end
end