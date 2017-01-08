module Home
  class Index < Operation
    def process
      result.new('Hello World!')
    end

    private
    def result
      Struct.new(:message)
    end
  end
end
