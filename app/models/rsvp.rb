class Rsvp
  include ActiveModel::Model

  attr_accessor :code, :num

  validates :code, presence: true
  validates :num, presence: true
  validates :num, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Access the visitor record after it's saved
  attr_reader :visitor

  def save
    if valid?
      persist!
    else
      false
    end
  end

  private
  def persist!
    @visitor = Visitor.find_by_code(code)
    @visitor.update_attribute(:num, num)
  end
end
