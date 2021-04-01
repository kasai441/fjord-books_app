# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable? should return true if target user equals report user' do
    one = reports(:one)
    target_user = users(:one)
    assert one.editable?(target_user)
  end

  test '#editable? should return false if target user differs report user' do
    one = reports(:one)
    target_user = users(:two)
    assert_not one.editable?(target_user)
  end

  test '#created_on should return created date' do
    one = reports(:one)
    one.created_at = Date.new(2021, 3, 31)
    assert_equal Date.new(2021, 3, 31), one.created_on
  end
end
