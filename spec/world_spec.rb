require 'spec_helper'

describe World do
  let(:world) { described_class.new(6, 6) }

  describe '#cells' do
    subject { world.cells }

    it { is_expected.to have_exactly(36).cells }
    it { is_expected.to all be_dead }
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

  describe '#next_generation' do
    subject do
      world.next_generation!
      cell
    end

    let(:cell) { world.cell_at(0, 0) }
    let(:neighbours) { cell.neighbours.first(neighbour_count) }

    context 'live cell' do
      before do
        cell.toggle
        neighbours.each(&:toggle)
      end

      context 'with no live neighbours' do
        let(:neighbour_count) { 0 }
        it { is_expected.to be_dead }
      end

      context 'with one live neighbour' do
        let(:neighbour_count) { 1 }
        it { is_expected.to be_dead }
      end

      context 'with two live neighbours' do
        let(:neighbour_count) { 2 }
        it { is_expected.to be_alive }
      end

      context 'with three live neighbours' do
        let(:neighbour_count) { 3 }
        it { is_expected.to be_alive }
      end
    end
  end
end
