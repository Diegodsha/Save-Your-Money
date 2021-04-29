require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) { 'simple name' }
  let(:user) { User.create(name: 'Diego', email: 'diego@hotmail.com', id: 1) }
  let(:user2) { User.create(name: 'TheRock', email: 'dwayneJ@hotmail.com', id: 2) }
  let(:user_no_name) { User.create(email: 'spongeb@hotmail.com') }
  let(:user_no_email) { User.create(name: 'SpongeBob') }
  let(:ex1) { Expense.new(name: 'Expense1', amount: 51) }
  let(:ex2) { Expense.new(name: 'Expense2', amount: 52) }
  let(:group) { Group.create(name: 'Group1', user_id: user.id) }

  describe 'Users can be created' do
    it 'User validates presence of name' do
      user_no_name.save

      expect(user_no_name).to_not be_valid
    end

    it 'User validates presence of email' do
      user_no_email.save

      expect(user_no_email).to_not be_valid
    end

    it 'A user can create an expense' do
      ex = Expense.new(name: 'Expense', amount: 50)
      ex.author_id = user.id
      ex.save

      expect(ex).to be_valid
    end

    it 'A user can have many expenses' do
      ex1.author_id = user.id
      ex1.save
      ex2.author_id = user.id
      ex2.save

      expect(Expense.first.author_id).to eq(user.id)
      expect(Expense.second.author_id).to eq(user.id)
    end

    it 'User can create a group' do
      gp = user.groups.new(name: 'group')
      gp.save

      expect(gp).to be_valid
    end
  end
end
