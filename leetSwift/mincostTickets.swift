//
//  mincostTickets.swift
//  leetSwift
//
//  Created by 王枫 on 6/5/2020.
//  Copyright © 2020 fitz. All rights reserved.
//


class MincostTickets {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        // 对应需要出行日期的最小花费,只有30天内的费用对今天有影响, 不需要记录全年
        var consume = [Int](repeating: 0, count: 30)
        // 下一个出行日索引
        var next = 0
        // 最后一个出行日
        let lastDay = days[days.count - 1]
        for i in days[0]...lastDay {
//            if days.contains(i) { // 这个效率很低
            if i == days[next] {    // 是出行日期，需要根据前1/7/30天的费用进行推算
                consume[i % 30] = min(consume[(i - 1) % 30] + costs[0],
                                      consume[max(i-7, 0) % 30] + costs[1],
                                      consume[max(0, i-30)%30] + costs[2])
                next += 1
            }
            else {  // 不是出行日期，费用等于前一天
                consume[i % 30] = consume[(i - 1) % 30]
            }
        }

        return consume[lastDay % 30]
    }
}
