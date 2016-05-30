# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  grams      :integer
#  owned      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string
#

class Item < ApplicationRecord
end
