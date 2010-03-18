require 'lib/unix'

describe Unix::Passwd do
  describe "basic class" do
    let(:passwd) { Unix::Passwd.new }

    it "should have the collection Unix::Pwent's" do
      passwd.should have_at_least(1).pwents
    end
  end

  describe "features via Enumerable" do
    let(:passwd) { Unix::Passwd.new }

    it "should respond to first" do
      passwd.should respond_to :first
      passwd.first.should respond_to :name
    end

    it "should be able to iterate through each pwent" do
      no_raise = lambda { passwd.each{|pwent| pwent} }
      no_raise.should_not raise_error
    end

    it "should be able to collect items" do
      passwd.collect(&:name).should have_at_least(1).item
    end

    it "should be sort'able" do
      sorted = passwd.sort{|a,b| a.gid <=> b.gid}
      (sorted.first.gid < sorted.last.gid).should be_true
    end

    it "should be able to find pwent by attribute" do
      (passwd.find{|p| p.name == 'root'}).name.should == 'root'
    end
  end
end
