module Home
  class Index < Operation
    def process
    end

    private
    def result
      Struct.new(:featured_cars)
    end
  end
end
