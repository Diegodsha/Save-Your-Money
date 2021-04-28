require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:name) { 'simple name' }
  let(:user) { User.create(name: 'Diego', email: 'diego@hotmail.com', id: 1) }
  let(:ex1) { Expense.new(name: 'Expense1', amount: 51) }
  let(:ex2) { Expense.new(name: 'Expense2', amount: 52) }
  let(:group) { Group.create(name: 'Group1', user_id: user.id, id: 1) }
  let(:inv_group) { Group.create(user_id: user.id) }

  describe 'Group can be created and validated' do
    it 'User can create a group' do
      gp = user.groups.new(name: 'group')
      gp.save

      expect(gp).to be_valid
    end

    it 'Group validates presence of name' do
      expect(inv_group).to_not be_valid
    end

    it 'Group can have many expenses' do
      ex1.group_ids = group.id
      ex1.save
      ex2.group_ids = group.id
      ex2.save
      group.save

      expect(group.expense_ids).to eq([ex1.id, ex2.id])
    end
  end
end
