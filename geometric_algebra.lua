Vector2 = {x = 0, y = 0}
Vector2.__index = Vector2

function Vector2:new(x, y)
    local self = setmetatable({}, Vector2)

    self.x = x
    self.y = y

    return self
end

function Vector2.__add(a, b)
    return Vector2:new(a.x + b.x, a.y + b.y)
end

function Vector2.__mul(a, b)
    return Rotor2:new(a:inner(b), a:outer(b).xy)
end

function Vector2.inner(a, b)
    return a.x*b.x + a.y*b.y
end

function Vector2.outer(a, b)
    return Bivector2:new(a.x*b.y - a.y*b.x)
end

function Vector2.mul_bivector(vector, bivector)
    return Vector2:new(-vector.y * bivector.xy, vector.x * bivector.xy)
end

function Vector2.mul_rotor(vector, rotor)
    return Vector2:new(vector.x * rotor.a - (vector.y * rotor.xy), vector.x * rotor.xy + vector.y * rotor.a)
end

function Vector2:magnitude()
    return math.sqrt(self.x*self.x + self.y*self.y)
end

function Vector2:normalized()
    local mag = self:magnitude()
    return Vector2:new(self.x/mag, self.y/mag)
end

function Vector2.rotate(vector, rotor)
    return rotor:neg():mul_vector(vector):mul_rotor(rotor)
end

Bivector2 = {xy = 0}
Bivector2.__index = Bivector2

function Bivector2:new(xy)
    local self = setmetatable({}, Bivector2)
    
    self.xy = xy

    return self
end

function Bivector2.mul_vector(bivector, vector)
    return Vector2:new(bivector.xy * vector.y, -bivector.xy * vector.x)
end

Rotor2 = {a = 0, xy = 0}
Rotor2.__index = Rotor2

function Rotor2:new(a, xy)
    local self = setmetatable({}, Rotor2)

    self.a = a
    self.xy = xy

    return self
end

function Rotor2.__mul(lhs, rhs)
    return Rotor2:new(lhs.a * rhs.a + -(lhs.xy * rhs.xy), lhs.a * rhs.xy + lhs.xy * rhs.a)
end

function Rotor2.mul_vector(rotor, vector)
    return Vector2:new(rotor.a * vector.x + rotor.xy * vector.y, rotor.a * vector.y - (rotor.xy * vector.x))
end

function Rotor2.neg(rotor)
    return Rotor2:new(rotor.a, -rotor.xy)
end
