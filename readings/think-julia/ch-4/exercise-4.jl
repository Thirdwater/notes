using ThinkJulia
using Luxor: Reposition


"""
polyline(turtle, num_sides, len, angle_degree)

Draws polyline with the given sides, side length, and interior angle (in degrees).
"""
function polyline(turtle::Turtle, num_sides::Int=4, len::Number=100, angle_degree::Number=360)
    for i in 1:num_sides
        forward(turtle, len)
        turn(turtle, angle_degree)
    end
end


"""
polygon(turtle, num_sides, len)

Draws a regular polygon with the given sides and side length.
"""
function polygon(turtle::Turtle, num_sides::Int=4, len::Number=100)
    turn_angle = 360 / num_sides
    polyline(turtle, num_sides, len, turn_angle)
end


"""
arc(turtle, radius, angle_degree, correction)

Draws an arc with the given radius and angle (in degrees).
"""
function arc(turtle::Turtle, radius::Number=50, angle_degree::Number=180, correction::Bool=true)
    arc_length = 2 * π * radius * angle_degree / 360
    num_sides = Int(floor(arc_length))
    len = arc_length / num_sides
    turn_angle = angle_degree / num_sides
    correction_angle = 0
    if correction
        correction_angle = turn_angle / 2
    end
    turn(turtle, correction_angle)
    polyline(turtle, num_sides, len, turn_angle)
    turn(turtle, correction_angle)
end


"""
circle(turtle, radius)

Draws a circle with the given radius.
"""
function circle(turtle::Turtle, radius::Number=50)
    arc(turtle, radius, 360, false)
end


function petal(turtle::Turtle, radius::Number=50, angle_degree::Number=60)
    reverse_angle = 180 - angle_degree
    for i in 1:2
        arc(turtle, radius, angle_degree, false)
        turn(turtle, reverse_angle)
    end
end


function flower(turtle::Turtle, radius::Number=50, angle_degree::Number=60, petals::Int=3)
    petal_angle = 360 / petals
    for i in 1:petals
        petal(turtle, radius, angle_degree)
        turn(turtle, petal_angle)
    end
end


function test_polygon()
    @svg begin
        turtle = Turtle()
        Reposition(turtle, -16, -50)
        for num_sides in 3:10
            polygon(turtle, num_sides, 32)
        end
    end 120 120
end


function test_circle()
    @svg begin
        turtle = Turtle()
        Reposition(turtle, 0, -50)
        for radius in 10:10:50
            circle(turtle, radius)
        end
    end 120 120
end


function test_arc()
    @svg begin
        for radius in 10:10:50
            turtle = Turtle()
            Reposition(turtle, 0, -50)
            arc(turtle, radius, 180)
        end
    end 120 120
end


function test_flower()
    @svg begin
        turtle1 = Turtle()
        Reposition(turtle1, -120, 0)
        flower(turtle1, 50, 60, 7)

        turtle2 = Turtle()
        flower(turtle2, 40, 80, 10)

        turtle3 = Turtle()
        Reposition(turtle3, 120, 0)
        flower(turtle3, 150, 20, 20)
    end 360 120
end
