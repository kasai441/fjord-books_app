# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'showing a Report' do
    visit reports_url
    click_on '詳細'
    assert_text '最初に書いた日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '日報２日目'
    fill_in '内容', with: '２日目に書いた日報'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '日報２日目'
    assert_text '２日目に書いた日報'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集', exact: true

    fill_in 'タイトル', with: '修正日報'
    fill_in '内容', with: '修正された日報'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '修正日報'
    assert_text '修正された日報'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end
end
