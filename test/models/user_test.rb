# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email should return email unless name presents' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
  end

  test '#name_or_email should return name if name presents' do
    user = User.new(email: 'foo@example.com', name: 'Foo Bar')
    assert_equal 'Foo Bar', user.name_or_email
  end

  test '#follow should add relationships between users' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')
    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
  end

  test '#unfollow should remove relationships between users' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')
    me.follow(she)
    assert me.following?(she)
    me.unfollow(she)
    assert_not me.following?(she)
  end
end
