class Url < ActiveRecord::Base
  MAX_RETRY = 5
  CHARS = %w(2 3 4 5 6 7 8 9 a b c d e f g h i j k m n p q r s t u v w x y z A B C D E F G H J K L M N P Q R S T U V W X Y Z)

  validates :url, presence: true, format: {with: URI.regexp}
  validates :slug, presence: true, uniqueness: true, allow_blank: true
  after_create :ensure_slug

  private
  def ensure_slug
    unless slug.present?
      begin
        retries ||= MAX_RETRY
        self.slug = ::Shortener.generate self.id
        self.save!
      rescue self::RecordNotUnique
        retry if (retries -= 1).nonzero?
      else
        self
      end
    end
  end
end
