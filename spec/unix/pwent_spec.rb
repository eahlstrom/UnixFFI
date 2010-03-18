require 'lib/unix'

describe Unix::Pwent do
  let(:pwent) { Unix::Passwd.new.first }

  describe "responds to 'struct passwd' attributes" do
    Unix::Pwent::ATTRIBUTES.each do |attr|
      it "pwent.#{attr}" do
        pwent.should respond_to attr
      end
    end
  end

  describe "responds to attributes with pw_xx stripped off" do
    Unix::Pwent::ATTR_SHORTNAME.each do |attr|
      it "pwent.#{attr}" do
        pwent.should respond_to attr
      end
    end
  end
end

