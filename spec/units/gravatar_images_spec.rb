require 'spec_helper'

RSpec.describe Schedroom::Integration::GravatarImage do
  context '#generate_path' do
    let(:gravatar_path) do
      'http://gravatar.com/avatar/f35d465b1281ff7434f2d254fba6a0a1.png?s=42&d=mm'
    end

    it 'returns a valid gravatar url path' do
      generated_path = Schedroom::Integration::GravatarImage.generate_path('foo@test.com', 42)
      expect(generated_path).to eq(gravatar_path)
    end
  end
end
