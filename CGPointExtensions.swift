import CoreGraphics
import Darwin

func +(a: CGPoint, b: CGPoint) -> CGPoint {
    return CGPoint(x: a.x + b.x, y: a.y + b.y)
}

func -(a: CGPoint, b: CGPoint) -> CGPoint {
    return CGPoint(x: a.x - b.x, y: a.y - b.y)
}

func *(a: CGPoint, b: CGFloat) -> CGPoint {
    return CGPoint(x: a.x * b, y: a.y * b)
}

func /(a: CGPoint, b: CGFloat) -> CGPoint {
    return CGPoint(x: a.x / b, y: a.y / b)
}

func +=(inout a: CGPoint, b: CGPoint) {
    a = a + b
}

func -=(inout a: CGPoint, b: CGPoint) {
    a = a - b
}

func *=(inout a: CGPoint, b: CGFloat) {
    a = a * b
}

func /=(inout a: CGPoint, b: CGFloat) {
    a = a / b
}

func distance(a: CGPoint, _ b: CGPoint) -> CGFloat {
    return sqrt(a.squaredDistance(b))
}

func squaredDistance(a: CGPoint, _ b: CGPoint) -> CGFloat {
    return a.squaredDistance(b)
}

extension CGPoint {
    func distance(a: CGPoint) -> CGFloat {
        return sqrt(self.squaredDistance(a))
    }
    
    func squaredDistance(a: CGPoint) -> CGFloat {
        let dx = a.x - self.x
        let dy = a.y - self.y
        return dx*dx + dy*dy
    }
}



