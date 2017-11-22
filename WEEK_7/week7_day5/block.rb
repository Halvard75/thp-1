require 'digest'
require 'pp'

LEDGER = []

class Block
  attr_reader :index, :nonce, :timestamp, :transaction, :transaction_count, :previous_hash, :hash

  def initialize(index, transaction, previous_hash)
    @index = index
    @timestamp = Time.now
    @transaction = transaction
    @transaction_count = transaction.size
    @previous_hash = previous_hash
    @hash, @nonce = compute_hash_with_proof_of_work
  end


  def compute_hash_with_proof_of_work(difficulty="00000000")
    nonce = 0
    loop do
      hash = compute_hash_with_nonce(nonce)
      if hash.start_with?(difficulty)
        return [hash, nonce]
      else
        nonce += 1
        print "#{nonce} - "
      end
    end
  end

  def compute_hash_with_nonce(nonce=0)
    sha = Digest::SHA256.new
    sha.update( @index.to_s + nonce.to_s + @timestamp.to_s +  @transaction.to_s +  @previous_hash )
    sha.hexdigest
  end

  def self.first(*transaction)
    Block.new(0, transaction, "0")
  end

  def self.next(previous, transaction)
    Block.new(previous.index+1, transaction, previous.hash)
  end
end # class block

def create_first_block
  i = 0
  instance_variable_set("@b#{i}", Block.first({from: "Anthony", to: "THP", what: "Beaucoup de fichier", qty: "10000000000" }))
  LEDGER << @b0
  pp @b0
  add_block
end

def add_block
  i = 1
  loop do
    instance_variable_set("@b#{i}", Block.next(instance_variable_get("@b#{i-1}"),get_transaction))
    LEDGER << instance_variable_get("@b#{i}")
    puts "===================="
    pp instance_variable_get("@b#{i}")
    puts "===================="
    i += 1
  end
end

def get_transaction
  transaction_block ||= []
  blank_transaction = Hash[from: "", to: "", what: "", qty: ""]
  loop do
    puts ""
    puts ""
    puts "Enter your name for the new transaction"
    from = gets.chomp
    puts ""
    puts "What do you want to send ?"
    what = gets.chomp
    puts ""
    puts "In how much quantity ?"
    qty = gets.chomp
    puts ""
    puts "For Who ?? :-)"
    to = gets.chomp

    transaction = Hash[from: "#{from}", to: "#{to}", what: "#{what}", qty: "#{qty}",]
    transaction_block << transaction

    puts ""
    puts "Do you want to make antoher transaction ? (Y/n)"
    new_transaction = gets.chomp.downcase

    if new_transaction == "y"
      self
    else
      return transaction_block
      break
    end
  end
end

create_first_block

# b0 = Block.first("THP")
# b1 = Block.next(b0, "THHHPPP")
# b2 = Block.next(b1, "More data")
# b3 = Block.next(b2, "Some more data")
# b4 = Block.next(b3, "More data again")
# b5 = Block.next(b4, "More more data")
#
# pp [b0, b1, b2, b3, b4, b5]
