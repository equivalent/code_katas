require_relative '../lib/bank_account'
require 'rspec-given'
require 'delegate'

class AuditAccount2 < DelegateClass(BankAccount)
  attr_reader :log

  def initialize(account, log)
    super(account)
    @log = log
  end

  def deposit(amount)
    super(amount)
    log.record(amount, :deposit)
  end
end

RSpec.describe AuditAccount2 do
  Given(:audit_log) { double record: nil }
  Given(:account) { BankAccount.new(20.0) }
  Given(:audit_account) { described_class.new(account, audit_log) }

  Then do
    expect(audit_account.number).to be account.number
  end

  Then do
    expect(audit_account.respond_to?(:number)).to be true
  end

  Then do
    expect(described_class.instance_methods.include?(:number)).to be true
  end

  Then do
    expect(audit_log)
      .to receive(:record)
      .with(11, :deposit)
    audit_account.deposit(11)
  end
end
