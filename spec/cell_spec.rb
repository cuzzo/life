require 'spec_helper'

describe Cell do
  let(:world) { World.new(6, 6) }
  let(:cell) { world.cell_at(2, 2) }

  describe '#world' do
    subject { cell.world }
    it { is_expected.to eq world }
  end

  describe '#x' do
    subject { cell.x }
    it { is_expected.to eq 2 }
  end

  describe '#y' do
    subject { cell.y }
    it { is_expected.to eq 2 }
  end

  describe '#dead?' do
    subject { cell.dead? }
    it { is_expected.to eq true }
  end

  describe '#neighbours' do
    subject { cell.neighbours }

    it { is_expected.to include(world.cell_at(1, 1)) }
    it { is_expected.to include(world.cell_at(1, 2)) }
    it { is_expected.to include(world.cell_at(1, 3)) }
    it { is_expected.to include(world.cell_at(2, 1)) }
    it { is_expected.to include(world.cell_at(2, 3)) }
    it { is_expected.to include(world.cell_at(3, 1)) }
    it { is_expected.to include(world.cell_at(3, 2)) }
    it { is_expected.to include(world.cell_at(3, 3)) }
    it { is_expected.to have_exactly(8).neighbours }
  end
end
