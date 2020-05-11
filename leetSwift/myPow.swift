/// Implement pow(x, n), which calculates x raised to the power n (x^n).
///
/// - Parameters:
///     - x: [-100.0, 100.0]
///     - n: [−2^31, 2^31 − 1]
///
/// - Returns: the power n of x
/// 
/// Example 1:
/// 
/// Input: 2.00000, 10
/// Output: 1024.00000
/// 
/// Example 2:
/// 
/// Input: 2.10000, 3
/// Output: 9.26100
/// 
/// Example 3:
/// 
/// Input: 2.00000, -2
/// Output: 0.25000
/// Explanation: 2-2 = 1/22 = 1/4 = 0.25
/// 
/// Note:
/// 
///     -100.0 < x < 100.0
///     n is a 32-bit signed integer, within the range [−231, 231 − 1]
class MyPow {
    func myPow(_ x: Double, _ n: Int) -> Double {
        // 处理 n 的符号
        return n >= 0 ? _quickMul2(x, n) : 1.0 / _quickMul2(x, -n)
    }

    /// ## 快速幂 + 递归
    /// 空间复杂度只需要 O(logN), 时间复杂度一样 O(logN)
    /// 例如 n = 99, 倒推分解为：
    /// - x ^ 99 = (x ^ 49) ^ 2 * x
    /// - x ^ 49 = (x ^ 24) ^ 2 * x
    /// - x ^ 24 = (x ^ 12) ^ 2
    /// - x ^ 12 = (x ^ 6) ^ 2
    /// - x ^ 6 = (x ^ 3) ^ 2 
    /// - x ^ 3 = (x ^ 1) ^ 2 * 2
    /// - x
    private func _quickMul1(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        let y = myPow(x, n / 2)
        // 如果 n 不能整除 2， 需要再乘以 x
        return n % 2 == 0 ? y * y : y * y * x
    }

    /// ## 快速幂 + 迭代
    /// 这种算法相比递归空间复杂度只需要 O(1), 时间复杂度一样 O(logN)
    /// 例如 n = 99, 观察递归算法发现:
    /// - x ^ 49 => x ^ 99, 贡献了 1个 x
    /// - x ^ 24 => x ^ 49, 贡献了 1个 x, 并随后平方了1次，即 x^(2^1)= x^2
    /// - 中间 3次无新贡献， 均为 0
    /// - x ^ 1 => x ^ 3, 贡献了 1个 x, 并随后平方了5次，即 x^(2^5)=x^32
    /// - x 平方了6次， 即 x^(2^6)=x^64
    /// - 刚好是 99 的二进制表达 1100011 : 64 + 32 + 2 + 1 = 99
    /// - 也就是统计二进制 99 中1的出现次数，并乘以相应的贡献值即可
    private func _quickMul2(_ x: Double, _ n: Int) -> Double {
        var result = 1.0
        // 初始化贡献值
        var contribute = x
        var N = n 
        while N > 0 {
            // N & 2 == 1
            if N % 2 == 1 {
                result *= contribute
            }
            contribute *= contribute
            // N << 1
            N /= 2
        }
        return result
    }
}
