class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :completed, presence: true

  class << self
    def mystery
      where(mystery: true)
    end
  end

  class << self
    def fiction
      where(fiction: true)
    end
  end
end
