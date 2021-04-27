# frozen_string_literal: true

class GroupsExpense < ApplicationRecord
  belongs_to :group
  belongs_to :expense
end
