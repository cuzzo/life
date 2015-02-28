require 'spec_helper'

describe World do
  describe '#tick' do
    let(:world) { described_class.new }

    subject do
      world.tick
      world.cell_at(cell.x, cell.y)
    end

    before do
      world << cell

      cell.neighbours_coordinates.first(neighbour_count).each do |x, y|
        world << AliveCell.new(world, x, y)
      end

      cell.neighbours_coordinates.last(8 - neighbour_count).each do |x, y|
        world << DeadCell.new(world, x, y)
      end
    end

    context 'live cell' do
      let(:cell) { AliveCell.new(world, 1, 1) }

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
      let(:cell) { DeadCell.new(world, 1, 1) }

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
