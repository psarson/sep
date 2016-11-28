include RSpec
require_relative 'node'
require_relative 'graph'
require_relative 'six_degrees_of_bacon'

RSpec.describe KevinBacon, type: Class do
    let (:elvis_presley) { Node.new("Elvis Presley") }
    let (:james_mcavoy)  { Node.new("James McAvoy") }
    let (:michael_fassbender) { Node.new("Michael Fassbender") }
    let (:ian_mckellen) { Node.new("Ian McKellen") }
    let (:edward_asner) { Node.new("Edward Asner") }
    let (:kevin_bacon) { Node.new("Kevin Bacon") }

    let (:the_hash) { Hash["change of habit" => [elvis_presley, edward_asner], "JKF" => [edward_asner, kevin_bacon], "X-Men: Days of Futures Past" => [michael_fassbender, james_mcavoy, ian_mckellen], "X-Men: First Class" => [michael_fassbender, james_mcavoy, kevin_bacon]] }

  it 'finds shortest path to given node' do
    graph = Graph.new
    graph.add_node(elvis_presley, the_hash)
    graph.add_node(james_mcavoy, the_hash)
    graph.add_node(michael_fassbender, the_hash)
    graph.add_node(edward_asner, the_hash)
    graph.add_node(ian_mckellen, the_hash)
    graph.add_node(kevin_bacon, the_hash)

    expect(KevinBacon.new(graph, elvis_presley).shortest_path_to(kevin_bacon)).to eq ["Elvis Presley", "Edward Asner", "Kevin Bacon"]
  end

end
