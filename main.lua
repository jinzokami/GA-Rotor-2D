require("geometric_algebra")

function love.load()
    a = Vector2:new(100, 0)
    b = Vector2:new(0, 100)

    timer = 0
end

function love.update()
    timer = timer + 0.001
    b = Vector2:new(100*math.cos(timer), 100*math.sin(timer))

    ab = a:normalized()*b:normalized()
    ba = b:normalized()*a:normalized()

    v = Vector2:new(200, 200)
    vq = v:rotate(ab)
end

function love.draw()
    --we pass in a and b rather than the bivector they form, since it is a psuedo scalar
    love.graphics.setColor(1, 0, 1, 0.5)
    draw_bivector(a, b, 400, 300)

    love.graphics.setColor(1, 0, 0)
    draw_vector(a, 400, 300)
    love.graphics.setColor(0, 0, 1)
    draw_vector(b, 400, 300)

    love.graphics.setColor(0, 1, 0)
    draw_vector(v, 400, 300)

    love.graphics.setColor(1, 1, 1)
    draw_vector(vq, 400, 300)

    love.graphics.print(ab.a.." "..ab.xy, 0, 0)
    love.graphics.print(ba.a.." "..ba.xy, 0, 16)
end

function draw_vector(vector, x, y)
    love.graphics.setLineWidth(3)
    love.graphics.line(x, y, x+vector.x, y+vector.y)
end

function draw_bivector(a, b, x, y)
    love.graphics.polygon("fill", x, y, x+a.x, y+a.y, x+a.x+b.x, y+a.y+b.y, x+b.x, y+b.y)
end