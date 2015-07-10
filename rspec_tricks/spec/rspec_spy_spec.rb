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

    context 'describe using instance_spy' do
      context 'when class is implemeted' do
        Foo = Class.new
        let(:foo) { instance_spy 'Foo' }

        it 'should raise error that spy have not implemeted public_method' do
          expect {
            DummyRunner.new(foo).run
          }.to raise_error(/does not implement the instance method: set_stuff/)
          # if class matching string ('Foo') spy_instance will compare
          # Class public methods before it's evalueted
          # therefore it won't get to `expect(foo).to have_received(:set_stuff)`
        end
      end

      context 'when class still not implemeted' do
        let(:bar) { instance_spy 'Bar' }

        before do
          DummyRunner.new(bar).run
        end

        it 'it should proceed to' do
          expect(bar).to have_received(:set_stuff)
        end
      end
    end
  end
end
