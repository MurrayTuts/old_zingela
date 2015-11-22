class FieldDatum < ActiveRecord::Base
  belongs_to :location
  belongs_to :project
  has_many :observations
  # accepts_nested_attributes_for :observations, :reject_if => lambda { |a| a[:n].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :observations, allow_destroy: true
  def full_name
    "Project: #{project.name} - Location: #{location.name} - Date: #{date}"
  end
  def short_name
    "#{project.name}, #{location.name}, #{date}"
  end
end
