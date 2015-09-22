# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  status      :string           default("Incomplete"), not null
#  permission  :string           default("Public"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Goal < ActiveRecord::Base
  validates :title, :description, :user_id, :status, :permission, presence: true
  validates :status, inclusion: { in: ["Complete", "Incomplete"] }
  validates :permission, inclusion: { in: ["Private", "Public"] }

  belongs_to :user

end
