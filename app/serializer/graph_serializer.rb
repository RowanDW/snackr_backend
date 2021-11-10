class GraphSerializer
  def self.get_graphs(highest, lowest)
    {
      "data": [
        {
          "type": "graph",
          "attributes": {
            "name": "#{highest.name}",
            "uri": "#{highest.uri}"
          }
        },
        {
          "type": "graph",
          "attributes": {
            "name": "#{lowest.name}",
            "uri": "#{lowest.uri}"
          }
        }
      ]
    }
  end
end
