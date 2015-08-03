import CoreGraphics
import Darwin

// Direction constants are in respect to SpriteKit's default space
let CGVectorUp    = CGVector(dx:  0.0, dy:  1.0)
let CGVectorDown  = CGVector(dx:  0.0, dy: -1.0)
let CGVectorRight = CGVector(dx:  1.0, dy:  0.0)
let CGVectorLeft  = CGVector(dx: -1.0, dy:  0.0)
let CGVectorZero  = CGVector(dx:  0.0, dy:  0.0)

func +(a: CGVector, b: CGVector) -> CGVector {
    return CGVector(dx: a.dx + b.dx, dy: a.dy + b.dy)
}

func -(a: CGVector, b: CGVector) -> CGVector {
    return CGVector(dx: a.dx - b.dx, dy: a.dy - b.dy)
}

func *(a: CGVector, b: CGFloat) -> CGVector {
    return CGVector(dx: a.dx * b, dy: a.dy * b)
}

func /(a: CGVector, b: CGFloat) -> CGVector {
    return CGVector(dx: a.dx / b, dy: a.dy / b)
}

func +=(inout a: CGVector, b: CGVector) {
    a = a + b
}

func -=(inout a: CGVector, b: CGVector) {
    a = a - b
}

func *=(inout a: CGVector, b: CGFloat) {
    a = a * b
}

func /=(inout a: CGVector, b: CGFloat) {
    a = a / b
}

func dot(a: CGVector, _ b: CGVector) -> CGFloat {
    return a.dot(b)
}

infix operator ⋅ { associativity left precedence 160 }
func ⋅(a: CGVector, b: CGVector) -> CGFloat {
    return dot(a, b)
}

extension CGVector {
    func dot(a: CGVector) -> CGFloat {
        return dx*a.dx + dy*a.dy
    }
    
    // Returns the direction of the vector in radians, in the range [-π, π]
    var angle: CGFloat {
        return atan2(dy, dx)
    }
    
    var squaredMagnitude: CGFloat {
        return dx*dx + dy*dy
    }
    
    var magnitude: CGFloat {
        return sqrt(squaredMagnitude)
    }
    
    var normalized: CGVector? {
        let m = magnitude
        return m == 0 ? nil : CGVector(dx: dx / m, dy: dy / m)
    }
    
    mutating func normalize() {
        if let n = normalized {
            self = n
        }
    }
    
    // Construct a unit vector aligned to the given angle
    init(angle: CGFloat) {
        self = CGVector(dx: cos(angle), dy: sin(angle))
    }
    
    init(point: CGPoint) {
        self = CGVector(dx: point.x, dy: point.y)
    }
}