# Based on Avdi grim ruby tapas episode 29x test spy

require 'rspec'

class DummyRunner
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def run
    user.set_stuff(123)
  end
end

RSpec.describe DummyRunner do
  describe '#run' do
    context 'described using regular object' do
      it do
        user = Object.new
        expect(user).to receive(:set_stuff).with(123)
        expect(user).not_to receive(:set_other_stuff)
        DummyRunner.new(user).run
      end
    end

    context "described using null object" do
      let(:user) { double(:user).as_null_object }

      before do
        DummyRunner.new(user).run
      end

      it do
        expect(user).to have_received(:set_stuff)
      end

      it do
        expect(user).not_to have_received(:set_other_stuff)
      end
    end

    # https://relishapp.com/rspec/rspec-mocks/docs/basics/spies
    context "described using spy" do
      let(:user) { spy }

      before do
        DummyRunner.new(user).run
      end

      it do
        expect(user).to have_received(:set_stuff).with(123)
      end

      it do
        expect(user).not_to have_received(:set_other_stuff)
      end
    end
  end
end
