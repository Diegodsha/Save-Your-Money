require 'rails_helper'

RSpec.describe GroupsExpense, type: :model do
    let(:name) { 'simple name' }
    let(:user) { User.create(name:'Diego', email:'diego@hotmail.com',id:1) }
    let(:ex1) { Expense.new(name:'Expense1',amount: 51) }
    let(:ex2) {Expense.new(name:'Expense2',amount: 52)}
    let(:group) { Group.create(name:'Group1',user_id:user.id) }

  describe "Groups have expenses " do
    it "Expense can belong to a group" do
        ex1.group_ids = group.id
        ex1.save
        group.save
    
        expect(group.expense_ids).to  eq([ex1.id])
       end

       it "Group can have many expenses" do
        ex1.group_ids = group.id
        ex1.save
        ex2.group_ids = group.id
        ex2.save
        group.save
    
        expect(group.expense_ids).to  eq([ex1.id, ex2.id])
      end

      it "Group expenses assosiation exists" do
        ex1.group_ids = group.id
        ex1.save
        ex2.group_ids = group.id
        ex2.save
        group.save

        expect(GroupsExpense.count).to eq(2)
      end
  end
end
