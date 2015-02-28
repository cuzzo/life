require 'spec_helper'

describe World do
  let(:world) { described_class.new(6, 6) }

  describe '#cells' do
    subject { world.cells }

    it { is_expected.to have_exactly(36).cells }
    it { is_expected.to all be_a(DeadCell) }
  end

  describe '#cell_at' do
    subject { world.cell_at(x, y) }

    context 'sixth cell' do
      let(:x) { 0 }
      let(:y) { 5 }

      it { is_expected.to eq world.cells[5] }
    end

    context 'seventh cell' do
      let(:x) { 1 }
      let(:y) { 0 }

      it { is_expected.to eq world.cells[6] }
    end
  end

  describe '#tick' do
    subject do
      world.tick
      cell
    end

    let(:cell) { world.cell_at(1, 1) }
    let(:neighbours) { cell.neighbours.first(neighbour_count) }
    before { neighbours.each { |n| world.toggle(n) } }

    context 'live cell' do
      before { world.toggle(cell) }

      context 'with no live neighbours' do
        let(:neighbour_count) { 0 }
        it { is_expected.to be_a(DeadCell) }
      end

      context 'with one live neighbour' do
        let(:neighbour_count) { 1 }
        it { is_expected.to be_a(DeadCell) }
      end

      context 'with two live neighbours' do
        let(:neighbour_count) { 2 }
        it { is_expected.to be_a(AliveCell) }
      end

      context 'with three live neighbours' do
        let(:neighbour_count) { 3 }
        it { is_expected.to be_a(AliveCell) }
      end

      context 'with more than three live neighbours' do
        let(:neighbour_count) { 4 }
        it { is_expected.to be_a(DeadCell) }
      end
    end

    context 'dead cell' do
      context 'with one live neighbour' do
        let(:neighbour_count) { 1 }
        it { is_expected.to be_a(DeadCell) }
      end

      context 'with two live neighbours' do
        let(:neighbour_count) { 2 }
        it { is_expected.to be_a(DeadCell) }
      end

      context 'with three live neighbours' do
        let(:neighbour_count) { 3 }
        it { is_expected.to be_a(AliveCell) }
      end
    end
  end
end
