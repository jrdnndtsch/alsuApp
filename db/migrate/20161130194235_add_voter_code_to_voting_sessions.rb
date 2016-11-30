class AddVoterCodeToVotingSessions < ActiveRecord::Migration
  def change
    add_column :voting_sessions, :voter_code, :string
  end
end
