# == Schema Information
#
# Table name: publications
#
#  id               :integer          not null, primary key
#  publication_type :text
#  year_published   :integer
#  title            :text
#  volume           :text
#  issue            :text
#  pages            :integer
#  url              :text
#  report_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Publication < ApplicationRecord
  belongs_to :report
end
