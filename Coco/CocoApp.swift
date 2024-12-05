//
//  CocoApp.swift
//  Coco
//
//  Created by 김하연 on 11/14/24.
//

import SwiftUI
import UserNotifications

@main
struct CODARIApp: App {
    // AppDelegate를 SwiftUI App에 연결
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            FirstView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // 앱 실행 시 사용자에게 알림 허용 권한을 받음
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self
        
        // 앱 실행 시 알림 권한을 요청
        requestNotificationAuthorization()
        
        return true
    }
    
    private func requestNotificationAuthorization() {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        // 사용자에게 알림 권한 요청
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
            if granted {
                print("알림 권한이 허용되었습니다.")
                // 권한이 허용되면 원격 알림을 등록할 수 있습니다. (필요한 경우)
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("알림 권한이 거부되었습니다.")
            }
        }
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // Foreground(앱 켜진 상태)에서 알림을 처리할 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 알림을 리스트와 배너 형태로 표시
        completionHandler([.banner, .list])
    }
    
    // Background 또는 푸시 알림을 클릭했을 때의 처리를 여기에 추가할 수 있습니다.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // 알림을 클릭했을 때의 추가 로직을 여기에 추가
        print("알림을 클릭했습니다: \(response.notification.request.content.body)")
        completionHandler()
    }
}

struct CocoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
