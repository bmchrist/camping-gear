# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  grams      :integer
#  owned      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ApplicationRecord
end