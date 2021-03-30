# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


class Auth
  attr_accessor :provider, :uid, :info

  def initialize(provider: '', uid: '', info: Info.new)
    @provider = provider
    @uid = uid
    @info = info
  end
end

class Info
  attr_accessor :name, :email

  def initialize(name: '', email: '')
    @name = name
    @email = email
  end
end
