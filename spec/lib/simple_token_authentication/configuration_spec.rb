require 'spec_helper'

describe SimpleTokenAuthentication::Configuration do

  context 'when included in any class' do

    before(:each) do
      SimpleTokenAuthentication.const_set(:ConfigurableClass, Class.new)
      klass = SimpleTokenAuthentication::ConfigurableClass
      klass.send :include, SimpleTokenAuthentication::Configuration
      @subject = klass.new
    end

    after(:each) do
      SimpleTokenAuthentication.send(:remove_const, :ConfigurableClass)
    end

    describe 'provides #adapters which' do

      it_behaves_like 'a configuration option', 'adapters'

      xit "defauts to ['active_record']", private: true do
        expect(@subject.adapters).to eq ['active_record']
      end
    end

    describe 'provides #header_names which' do

      it_behaves_like 'a configuration option', 'header_names'

      it 'defauts to {}', private: true  do
        expect(@subject.header_names).to eq({})
      end
    end

    describe 'provides #sign_in_token which' do

      it_behaves_like 'a configuration option', 'sign_in_token'

      it 'defauts to false', private: true do
        expect(@subject.sign_in_token).to eq false
      end
    end
  end
end
