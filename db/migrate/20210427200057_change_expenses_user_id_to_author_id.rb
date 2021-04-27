# frozen_string_literal: true

class ChangeExpensesUserIdToAuthorId < ActiveRecord::Migration[6.1]
  def change
    change_table :expenses do |t|
      t.remove :user_id
      t.references :author, null: false, foreign_key: { to_table: :users }, default: 1
    end
  end
end
