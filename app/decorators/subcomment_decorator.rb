class SubcommentDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user

  def for?(subcommentable)
    subcommentable = subcommentable.object if subcommentable.decorated?

    subcommentable == self.subcommentable
  end
end