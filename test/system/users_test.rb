# # frozen_string_literal: true
#
# require 'application_system_test_case'
#
# class BooksTest < ApplicationSystemTestCase
#   setup do
#     visit root_url
#     fill_in 'Eメール', with: 'alice@example.com'
#     fill_in 'パスワード', with: 'password'
#     click_on 'ログイン'
#   end
#
#   test 'visiting the index' do
#     visit books_url
#     assert_selector 'h1', text: '本'
#     assert_text '最初の本'
#   end
#
#   test 'showing a Book' do
#     visit books_url
#     click_on '詳細'
#     assert_text '最初の本'
#     assert_text '最初に表示される'
#   end
#
#   test 'creating a Book' do
#     visit books_url
#     click_on '新規作成'
#
#     fill_in 'タイトル', with: '植物図鑑'
#     fill_in 'メモ', with: '何もかも余裕ができたら買う'
#     click_on '登録する'
#
#     assert_text '本が作成されました。'
#     assert_text '植物図鑑'
#     assert_text '何もかも余裕ができたら買う'
#   end
#
#   test 'updating a Book' do
#     visit books_url
#     click_on '編集', exact: true
#
#     fill_in 'メモ', with: '技術本'
#     fill_in 'タイトル', with: '比較的安易にポチる'
#     click_on '更新する'
#
#     assert_text '本が更新されました。'
#     assert_text '技術本'
#     assert_text '比較的安易にポチる'
#   end
#
#   test 'destroying a Book' do
#     visit books_url
#     page.accept_confirm do
#       click_on '削除'
#     end
#
#     assert_text '本が削除されました。'
#   end
# end
