require 'spec_helper'

describe Version do
  context 'default' do
    it 'should have versioning off by default' do
      ::PaperTrail.enabled?.should_not be_true
    end
    it 'should turn versioning on in a with_versioning block' do
      ::PaperTrail.enabled?.should_not be_true
      with_versioning do
        ::PaperTrail.enabled?.should be_true
      end
      ::PaperTrail.enabled?.should_not be_true
    end
  end
  context 'versioning: true', versioning: true do
    it 'should have versioning on by default' do
      ::PaperTrail.enabled?.should be_true
    end
    it 'should keep versioning on after a with_versioning block' do
      ::PaperTrail.enabled?.should be_true
      with_versioning do
        ::PaperTrail.enabled?.should be_true
      end
      ::PaperTrail.enabled?.should be_true
    end
  end
end
