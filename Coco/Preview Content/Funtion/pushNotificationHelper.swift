//
//  pushNotificationHelper.swift
//  Coco
//
//  Created by 김하연 on 11/28/24.
//

import UserNotifications

// 로컬 알림을 설정하는 헬퍼 함수
func pushNotification(title: String, body: String, seconds: Double, identifier: String) {
    // 알림 내용 설정
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = title
    notificationContent.body = body
    notificationContent.sound = .default

    // 알림 발송 조건 (시간 후)
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)

    // 알림 요청 생성
    let request = UNNotificationRequest(identifier: identifier,
                                        content: notificationContent,
                                        trigger: trigger)

    // 알림을 시스템에 등록
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("알림 오류: ", error)
        } else {
            print("알림 등록 완료")
        }
    }
}
