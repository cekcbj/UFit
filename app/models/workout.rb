class Workout < ActiveRecord::Base

  validates :name, presence: true
  validates :user_id, presence: true
  acts_as_schedulable :schedule, occurrences: :workout_occurrences
  belongs_to :user
  has_many :workout_items
  has_many :exercises, :through => :workout_items, :class_name => 'Exercise'

  def date
    self.schedule.date
  end

  accepts_nested_attributes_for :workout_items, :allow_destroy => true
  accepts_nested_attributes_for :exercises



end
