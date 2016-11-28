shared_examples_for :addable do
  let(:model) { described_class }
  let(:addable) { create(model.to_s.underscore.to_sym) }

  it { should have_many(:additives) }
end
