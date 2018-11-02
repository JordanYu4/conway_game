# Not supposed to actually work 

describe "Game of life" do 
  it "should be dead" do 
    cell = Cell.new
    expect cell.active? to.be(false)
  end
end