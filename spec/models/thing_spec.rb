require 'spec_helper'

describe Thing do
	it 'should be versioned' do
		Thing.new.should be_versioned
	end
end
