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

    context 'live cell with no live neighbours' do
      before { cell.toggle }
      it { is_expected.to be_dead }
    end

    context 'live cell with one live neighbour' do
      let(:neighbour) { cell.neighbours.first }
      before do
        cell.toggle
        neighbour.toggle
      end
      it { is_expected.to be_dead }
    end

    context 'live cell with two live neighbours' do
      let(:neighbours) { cell.neighbours.first(2) }
      before do
        cell.toggle
        neighbours.each(&:toggle)
      end
      it { is_expected.to be_alive }
    end

    context 'live cell with three live neighbours' do
      let(:neighbours) { cell.neighbours.first(3) }
      before do
        cell.toggle
        neighbours.each(&:toggle)
      end
      it { is_expected.to be_alive }
    end
  end
end
