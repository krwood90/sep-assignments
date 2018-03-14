require_relative 'city'

def distancer(loc1, loc2)
    Math.hypot(loc2.x - loc1.x, loc2.y - loc1.y)
end

def nearest_neighbor(graph_of_cities, current_city)
    route = [current_city.name]
    until graph_of_cities[0].nil?
        next_city = graph_of_cities[0]
        graph_of_cities.each do |option|
            if distancer(current_city, next_city) > distancer(current_city, option)
                next_city = option
            end
        end
        current_city = next_city
        graph_of_cities.delete(next_city)
        route.push(current_city.name)
    end
    route
end

home = City.new("Dallas", 0, 0)
city2 = City.new("Ames", 0, 8)
city3 = City.new("Seattle", 5, 10)
city4 = City.new("Vancouver", 5, 12)
city5 = City.new("Chicago", 2, 8)
city6 = City.new("Los Angeles", 4, 2)
city7 = City.new("Tokyo", 18, 16)
city8 = City.new("Barcelona", 20, 12)
city9 = City.new("Rome", 24, 10)
city10 = City.new("Miami", 6, 1)

city_graph = [city2, city4, city10, city3, city9, city7, city6, city5, city8]

trip_route = nearest_neighbor(city_graph, home)
puts trip_route