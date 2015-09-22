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

FactoryGirl.define do
  factory :goal do
    title {Faker::Lorem.sentence(3)}
    description {Faker::Lorem.sentences(3)}
    user_id 1
    status {["Incomplete", "Complete"].sample}
    permission {["Public", "Private"].sample}
  end
end
