# frozen_string_literal:true

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @micropost = @user.microposts.build(content: 'Lorem ipsum')
  end

  # valid micropost
  test 'should be valid' do
    assert @micropost.valid?
  end

  # user id is valid
  test 'user id should be present' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  # content presence must be true
  test 'content should be present' do
    @micropost.content = nil
    assert_not @micropost.valid?
  end

  # content should be less than 140 char
  test 'content should be at most 140 characters' do
    @micropost.content = 'a' * 141
    assert_not @micropost.valid?
  end
  # most recent micropost comes at the top
  test 'order should be most recent first' do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
