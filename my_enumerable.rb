class Array

  def my_each(&proc)

    counter = 0
    while counter < self.length
      block_given? ? yield(self[counter]) : proc.call(self[counter])
      counter += 1
    end

  end

  def my_select(&proc)
    result = []

    self.my_each do |elem|
      # if the function given returns true, push to array
      if block_given?
        result << elem if yield(elem)
      else
        result << elem if proc.call(elem)
      end
    end

    result
  end # my_select

  def my_all?(&proc)
    self.my_each do |elem|
      if block_given?
        if yield(elem)
          next
        else
          return false
        end
      else
        if proc.call(elem)
          next
        else
          return false
        end
      end
    end

    true
  end

end