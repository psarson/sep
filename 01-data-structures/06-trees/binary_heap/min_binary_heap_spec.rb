include RSpec
require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Array.new(["The Matrix", 87]) }

  let (:tree) { MinBinaryHeap.new }
  let (:pacific_rim) { Array.new(["Pacific Rim", 72]) }
  let (:braveheart) { Array.new(["Braveheart", 78]) }
  let (:jedi) { Array.new(["Star Wars: Return of the Jedi", 80]) }
  let (:donnie) { Array.new(["Donnie Darko", 85]) }
  let (:inception) { Array.new(["Inception", 86]) }
  let (:district) { Array.new(["District 9", 90]) }
  let (:shawshank) { Array.new(["The Shawshank Redemption", 91]) }
  let (:martian) { Array.new(["The Martian", 92]) }
  let (:hope) { Array.new(["Star Wars: A New Hope", 93]) }
  let (:empire) { Array.new(["Star Wars: The Empire Strikes Back", 94]) }
  let (:mad_max_2) { Array.new(["Mad Max 2: The Road Warrior", 98]) }

  describe "#insert(data)" do
      it "properly inserts a new node and swaps parent of a higher value" do
        tree.insert(root)
        tree.insert(pacific_rim)
        expect(tree.show_children("Pacific Rim")).to eq "left: [\"The Matrix\", 87]"
        expect(tree.show_parent("Pacific Rim")).to eq "parent: [\"Pacific Rim\", 72]"
      end

      it "properly inserts a new node and swaps parent of a higher value" do
        tree.insert(braveheart)
        tree.insert(jedi)
        tree.insert(donnie)
        tree.insert(district)
        tree.insert(pacific_rim)
        expect(tree.show_parent("Pacific Rim")).to eq "parent: [\"Pacific Rim\", 72]"
        expect(tree.show_parent("Braveheart")).to eq "parent: [\"Braveheart\", 78]"
      end
    end

  describe "#find(data)" do
      it "properly finds a node" do
        tree.insert(braveheart)
        tree.insert(jedi)
        tree.insert(donnie)
        tree.insert(district)
        tree.insert(pacific_rim)
        expect(tree.show_parent("Pacific Rim")).to eq "parent: [\"Pacific Rim\", 72]"
      end
  end

  describe "#delete(data)" do
      it "properly deletes min value" do
        tree.insert(braveheart)
        tree.insert(jedi)
        tree.insert(donnie)
        tree.insert(district)
        tree.insert(pacific_rim)
        tree.delete("Pacific Rim")
        expect(tree.show_parent("Braveheart")).to eq "parent: [\"Braveheart\", 78]"
      end

      it "properly deletes max value" do
        tree.insert(braveheart)
        tree.insert(jedi)
        tree.insert(donnie)
        tree.insert(district)
        tree.insert(pacific_rim)
        tree.delete("District 9")
        expect(tree.show_parent("Donnie Darko")).to eq "parent: [\"Donnie Darko\", 85]"
      end

      it "properly deletes middle value" do
        tree.insert(braveheart)
        tree.insert(jedi)
        tree.insert(donnie)
        tree.insert(district)
        tree.insert(pacific_rim)
        tree.delete("Braveheart")
        expect(tree.show_parent("Star Wars: Return of the Jedi")).to eq "parent: [\"Star Wars: Return of the Jedi\", 80]"
      end
  end

  describe "#printf" do
    specify {
      expected_output = "Pacific Rim: 72\nBraveheart: 78\nDonnie Darko: 85\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nStars Wars: The Empire Strikes Back: 94\n"
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(district)
      tree.insert(pacific_rim)
      tree.insert(empire)
      expect { tree.printf }.to output(expected_output).to_stdout
    }
    end
  end
