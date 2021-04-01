# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#name_or_email should return email unless name presents' do
    assert_equal 'alice@example.com', @alice.name_or_email
  end

  test '#name_or_email should return name if name presents' do
    @alice.name = 'Alice'
    assert_equal 'Alice', @alice.name_or_email
  end

  test '#follow should add relationships between users' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#unfollow should remove relationships between users' do
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end

  test '#following? should return true if one user follows another' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#followed_by? should return true if one user is followed by another' do
    assert_not @alice.followed_by?(@bob)
    @bob.follow(@alice)
    assert @alice.followed_by?(@bob)
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
