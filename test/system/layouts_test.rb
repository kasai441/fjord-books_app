# frozen_string_literal: true

require 'application_system_test_case'

class LayoutsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
    assert_text '最初の本'
  end

  test 'visiting Books list' do
    click_on '本'
    assert_selector 'h1', text: '本'
    assert_text '最初の本'
  end

  test 'visiting Users list' do
    click_on 'ユーザ'
    assert_selector 'h1', text: 'ユーザ'
    assert_text 'alice@example.com'
  end

  test 'visiting Reports list' do
    click_on '日報'
    assert_selector 'h1', text: '日報'
    assert_text '最初の日報'
  end
end
