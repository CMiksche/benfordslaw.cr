require "./spec_helper"

describe BenfordsLaw do
  it "simple check" do
    test = BenfordsLaw::Check.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    test.chiSquared.should eq(0.40105320411553363)
  end

  it "zeroes should be ignored" do
    test = BenfordsLaw::Check.new([0, 1, 0, 2, 3, 4, 0, 5, 6, 7, 8, 9, 0])
    test.chiSquared.should eq(0.40105320411553363)
  end

  it "check backwards" do
    test = BenfordsLaw::Check.new([9, 8, 7, 6, 5, 4, 3, 2, 1])
    test.chiSquared.should eq(0.40105320411553363)
  end

  it "check two digits" do
    test = BenfordsLaw::Check.new([12, 25, 38, 40, 54, 63, 75, 83, 96])
    test.chiSquared.should eq(0.40105320411553363)
  end

  it "check three digits" do
    test = BenfordsLaw::Check.new([122, 256, 382, 402, 546, 632, 757, 832, 964])
    test.chiSquared.should eq(0.40105320411553363)
  end

  it "check a bigger array" do
    test = BenfordsLaw::Check.new([1, 1, 1, 1, 1, 1, 1, 1,
                                   2, 2, 2, 2,
                                   3, 3, 3,
                                   4, 4,
                                   5, 5,
                                   6, 6,
                                   7, 7,
                                   8,
                                   9])
    test.chiSquared.should eq(0.019868294035033682)
  end

  it "check random numbers" do
    test = BenfordsLaw::Check.new([3, 6, 6, 9, 4, 9, 1, 1, 8, 4, 7, 2, 5, 3, 1, 4, 8, 4, 2, 2, 6, 1])
    test.chiSquared.should eq(0.3034231881809182)
  end

  it "check bigger random numbers" do
    test = BenfordsLaw::Check.new([1, 2, 2, 2, 5, 6, 3, 8, 2, 4, 0, 2, 5, 4, 6, 6, 3, 2, 7, 5, 7, 8, 3, 2, 9, 6, 4, 1, 3, 2, 6, 9, 4, 1, 4, 7, 4, 9, 2, 1, 4, 9, 2, 6, 8, 3, 8, 9, 3, 8, 3, 5])
    test.chiSquared.should eq(0.32533042485042685)
  end

  it "check dist" do
    test = BenfordsLaw::Check.new([3, 6, 6, 9, 4, 9, 1, 1, 8, 4, 7, 2, 5, 3, 1, 4, 8, 4, 2, 2, 6, 1])
    test.dist.should eq([0.18181818181818182, 0.13636363636363635, 0.09090909090909091, 0.18181818181818182, 0.045454545454545456, 0.13636363636363635, 0.045454545454545456, 0.09090909090909091, 0.09090909090909091])
  end
end
