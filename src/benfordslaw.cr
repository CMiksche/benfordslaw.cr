require "chi-squared"

module BenfordsLaw
  VERSION = "0.1.0"

  class Check
    @dist : Array(Float64)
    @chiSquared : Float64

    # firstDigit returns only the first digit of each number but no zeroes
    def firstDigit(numbers : Array(Int32)) : Array(Int32)
      result = [] of Int32
      numbers.each do |value|
        # only the first digit
        while value >= 10
          value = value / 10
        end
        # no 0
        if value == 0
          next
        end
        result.push(value.to_i)
      end
      return result
    end

    # Count the occurrences of one number
    def countOccurrencesOfOne(numbers : Array(Int32), searched : Int32) : Int32
      result = 0
      numbers.each do |value|
        if value == searched
          result = result + 1
        end
      end
      return result
    end

    # Count the occurrences of every number in a array
    def countOccurrences(numbers : Array(Int32)) : Array(Int32)
      result = [] of Int32
      searched = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      searched.each do |value|
        found = countOccurrencesOfOne(numbers, value)
        result.push(found)
      end
      return result
    end

    # Get the distribution of 1 to 9 in the number array
    def countDistribution(occurrences : Array(Int32)) : Array(Float64)
      sum = 0.0
      result = [] of Float64
      occurrences.each do |value|
        sum = sum + value
      end
      occurrences.each do |value|
        res = value / sum
        result.push(res)
      end
      return result
    end

    def initialize(numbers)
      benford = [
        0.301, # 1
        0.176, # 2
        0.125, # 3
        0.097, # 4
        0.079, # 5
        0.067, # 6
        0.058, # 7
        0.051, # 8
        0.046, # 9
      ]
      occurrences = countOccurrences(firstDigit(numbers))
      @dist = countDistribution(occurrences)
      test = ChiSquared::Test.new(dist, benford)
      @chiSquared = test.result
    end

    def dist : Array(Float64)
      @dist
    end

    def chiSquared : Float64
      @chiSquared
    end
  end
end
