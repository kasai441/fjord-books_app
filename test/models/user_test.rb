# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email should return email unless name presents' do
    one = users(:one)
    assert_equal 'one@example.com', one.name_or_email
  end

  test '#name_or_email should return name if name presents' do
    one = users(:one)
    one.name = 'One'
    assert_equal 'One', one.name_or_email
  end

  test '#follow should add relationships between users' do
    one = users(:one)
    two = users(:two)
    assert_not one.following?(two)
    one.follow(two)
    assert one.following?(two)
  end

  test '#unfollow should remove relationships between users' do
    one = users(:one)
    two = users(:two)
    one.follow(two)
    assert one.following?(two)
    one.unfollow(two)
    assert_not one.following?(two)
  end

  test '#following? should return true if one user follows another' do
    one = users(:one)
    two = users(:two)
    assert_not one.following?(two)
    one.follow(two)
    assert one.following?(two)
  end

  test '#followed_by? should return true if one user is followed by another' do
    one = users(:one)
    two = users(:two)
    assert_not one.followed_by?(two)
    two.follow(one)
    assert one.followed_by?(two)
  end

  test '#from_omniauth should return existing user if it exists' do
    auth = Auth.new(provider: 'GitHub',
                    uid: '1',
                    info: Info.new(name: 'authenticated',
                                   email: 'authenticated@example.com'))
    user = User.from_omniauth(auth)
    assert_equal 'GitHub', user.provider
    assert_equal '1', user.uid
    assert_equal 'existing', user.name
    assert_equal 'existing@example.com', user.email
  end

  test '#from_omniauth should return user having authentication parameters' do
    auth = Auth.new(provider: 'GitHub',
                    uid: '10',
                    info: Info.new(name: 'authenticated',
                                   email: 'authenticated@example.com'))
    user = User.from_omniauth(auth)
    assert_equal 'GitHub', user.provider
    assert_equal '10', user.uid
    assert_equal 'authenticated', user.name
    assert_equal 'authenticated@example.com', user.email
    assert_equal 20, user.password.size
  end

end
