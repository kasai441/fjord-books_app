# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'showing a User' do
    visit users_url
    click_on '詳細', match: :first
    assert_text '不思議の国のアリスの主人公です'
    assert_text '編集 | 戻る'
  end

  test 'creating a User' do
    click_on 'ログアウト'
    click_on 'アカウント登録'

    fill_in 'Eメール', with: 'carol@example.com'
    fill_in '氏名', with: 'Carol'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'
    click_on 'アカウント登録'

    assert_text 'アカウント登録が完了しました。'
    assert_text 'carol@example.com'
  end

  test 'updating a User' do
    visit users_url
    click_on 'アカウント編集'

    fill_in '郵便番号', with: '123_4567'
    fill_in '住所', with: 'アメリカ合衆国マサチューセッツ州'
    fill_in '自己紹介文', with: '不思議の国のアリスの主人公です 続編もあります'
    fill_in '現在のパスワード', with: 'password'
    click_on '更新'

    assert_text 'アカウント情報を変更しました。'
    assert_text '123_4567'
    assert_text 'アメリカ合衆国マサチューセッツ州'
    assert_text '不思議の国のアリスの主人公です 続編もあります'
  end

  test 'destroying a User' do
    visit users_url
    click_on 'アカウント編集', exact: true

    page.accept_confirm do
      click_on 'アカウント削除'
    end

    assert_text 'アカウントを削除しました。またのご利用をお待ちしております。'
  end
end
