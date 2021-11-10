class GraphSerializer
  def self.get_graphs(highest, lowest)
    {
      "data": [
        {
          "type": 'graph',
          "attributes": {
            "name": highest.name.to_s,
            "uri": highest.uri.to_s
          }
        },
        {
          "type": 'graph',
          "attributes": {
            "name": lowest.name.to_s,
            "uri": lowest.uri.to_s
          }
        }
      ]
    }
  end
end
