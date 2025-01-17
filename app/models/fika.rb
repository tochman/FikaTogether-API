class Fika < ApplicationRecord
  validates_presence_of :start_date, :end_date

  has_and_belongs_to_many :participants, join_table: 'fikas_participants'

  private

  def self.participants_uniq_matcher
    participants = Participant.all
    possible_participant_pairings = participants.to_a.permutation(2).to_a
    unique_pairings = []
    possible_participant_pairings.each do |pair|
      unique_pairings.push(pair.sort_by(&:id))
    end
    unique_pairings.uniq!
    unique_pairings
  end
end