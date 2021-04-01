# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:default_report)
  end
  test '#editable? should return true if target user equals report user' do
    target_user = users(:alice)
    assert @report.editable?(target_user)
  end

  test '#editable? should return false if target user differs report user' do
    target_user = users(:bob)
    assert_not @report.editable?(target_user)
  end

  test '#created_on should return created date' do
    @report.created_at = Date.new(2021, 3, 31)
    assert_equal Date.new(2021, 3, 31), @report.created_on
  end
end
