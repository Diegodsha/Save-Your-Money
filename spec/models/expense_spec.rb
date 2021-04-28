require 'rails_helper'

RSpec.describe Expense, type: :model do
let(:name) { 'simple name' }
let(:author) { User.create(name:'Diego', email:'diego@hotmail.com',id:1) }
let(:ex1) { Expense.new(name:'Expense1',amount: 51) }
let(:ex2) {Expense.new(name:'Expense2',amount: 52)}
let(:group) { Group.create(name:'Group1',user_id:author.id) }
let(:ex_no_name) { Expense.new(amount: 51) }
let(:ex_no_amount) { Expense.new(name:'Expense1') } 

 describe "Expenses can be created and validated" do
   it "A user can create an expense" do
    ex1.author_id = author.id
    ex1.save
     
    expect(ex1).to be_valid
   end

   it "Expense validates presence of name" do
     expect(ex_no_name).to_not be_valid
   end

   it "Expense validates presence of amount" do
    expect(ex_no_amount).to_not be_valid
   end
   
   
   it "A user can have many expenses" do
    ex1.author_id = author.id
    ex1.save
    ex2.author_id = author.id
    ex2.save
     
    expect(Expense.first.author_id).to eq(author.id)
    expect(Expense.second.author_id).to eq(author.id)
   end

   it "Expense can belong to a group" do
    ex1.group_ids = group.id
    ex1.save
    group.save

    expect(group.expense_ids).to  eq([ex1.id])
     
   end
   
 end
end
