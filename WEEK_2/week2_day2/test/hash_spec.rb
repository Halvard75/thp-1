=begin
describe Hash do
  it "should return a blank instance" do
    Hash.new.should == {}
  end
end

describe Hash do
  before do
    @hash = Hash.new({:hello => 'world'})
  end
 
  it "should return a blank instance" do
    Hash.new.should == {}
  end
 
  it "hash the correct information in a key" do
    @hash[:hello].should == 'world'
  end
end


describe MyClass do
  describe ".class_method_1" do
  end
 
  describe "#instance_method_1" do
  end
end


#1
describe Burger do
  describe "#apply_ketchup" do
    context "with ketchup" do
      before do
        @burger = Burger.new(:ketchup => true)
        @burger.apply_ketchup
      end
 
      it "sets the ketchup flag to true" do
        @burger.has_ketchup_on_it?.should be_true
      end
    end
 
    context "without ketchup" do
      before do
        @burger = Burger.new(:ketchup => false)
        @burger.apply_ketchup
      end
 
      it "sets the ketchup flag to false" do
        @burger.has_ketchup_on_it?.should be_false
      end
    end
  end
end

#2
describe Burger do
  describe "#apply_ketchup" do
    context "with ketchup" do
      let(:burger) { Burger.new(:ketchup => true) }
      before  { burger.apply_ketchup }
 
      it "sets the ketchup flag to true" do
        burger.has_ketchup_on_it?.should be_true
      end
    end
 
    context "without ketchup" do
      let(:burger) { Burger.new(:ketchup => false) }
      before  { burger.apply_ketchup }
 
      it "sets the ketchup flag to false" do
        burger.has_ketchup_on_it?.should be_false
      end
    end
  end
end

#3
describe Burger do
  describe "#apply_ketchup" do
    subject { burger }
    before  { burger.apply_ketchup }
 
    context "with ketchup" do
      let(:burger) { Burger.new(:ketchup => true) }
 
      specify { subject.has_ketchup_on_it?.should be_true }
    end
 
    context "without ketchup" do
      let(:burger) { Burger.new(:ketchup => true) }
 
      specify { subject.has_ketchup_on_it?.should be_false }
    end
  end
end


#4
class Burger
  attr_reader :options
 
  def initialize(options={})
    @options = options
  end
 
  def apply_ketchup
    @ketchup = @options[:ketchup]
  end
 
  def has_ketchup_on_it?
    @ketchup
  end
    def apply_mustard
    @mustard = @options[:mustard]
  end
 
  def has_mustard_on_it?
    @mustard
  end
end
 
 
describe Burger do
  describe "#apply_ketchup" do
    subject { burger }
    before  { burger.apply_ketchup }
 
    context "with ketchup" do
      let(:burger) { Burger.new(:ketchup => true) }
 
      it { should have_ketchup_on_it }
    end
 
    context "without ketchup" do
      let(:burger) { Burger.new(:ketchup => false) }
 
      it { should_not have_ketchup_on_it }
    end
  end
end

describe Burger do
  describe "#apply_mustard" do
    subject { burger }
    before  { burger.apply_mustard }
 
    context "with mustard" do
      let(:burger) { Burger.new(:mustard => true) }
 
      it { should have_mustard_on_it }
    end
 
    context "without mustard" do
      let(:burger) { Burger.new(:mustard => false) }
 
      it { should_not have_mustard_on_it }
    end
  end
end

Burger


def test_making_order
  book = Book.new(:title => "RSpec Intro", :price => 20)
  customer = Customer.new
  order = Order.new(customer, book)

  order.submit

  assert(customer.orders.last == order)
  assert(customer.ordered_books.last == book)
  assert(order.complete?)
  assert(!order.shipped?)
end
=end

describe Order do
  describe "#submit" do

    before do
      @book = Book.new(:title => "RSpec Intro", :price => 20)
      @customer = Customer.new
      @order = Order.new(@customer, @book)

      @order.submit
    end

    describe "customer" do
      it "puts the ordered book in customer's order history" do
        expect(@customer.orders).to include(@order)
        expect(@customer.ordered_books).to include(@book)
      end
    end

    describe "order" do
      it "is marked as complete" do
        expect(@order).to be_complete
      end

      it "is not yet shipped" do
        expect(@order).not_to be_shipped
      end
    end
  end
end
