//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCore: AppCore?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        if let windowScene = (scene as? UIWindowScene) {
            let window = UIWindow(windowScene: windowScene)
            self.window = window

            let appStateHolder = AppStateHolder(appState: AppState.initialState)
            let eventHandler = AppEventHandler()
            let appRouter = AppRouter(appUIWindow: window, appStateHolder: appStateHolder, eventHandler: eventHandler)
            appCore = AppCore(appStateHolder: appStateHolder, eventHandler: eventHandler, router: appRouter)
            appCore?.setupDependencies()

            window.makeKeyAndVisible()

            eventHandler.post(event: AppStarted())
        }
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print(URLContexts)

//        if URLContexts.count == 1 {
//            guard let xpto = URLContexts.first?.url else { return }
//            print(xpto)
//
//            let accessT = xpto.absoluteString.split(separator: "#").last!.split(separator: "&").filter { $0.contains("access_token") }
//
//            let authToken2 = accessT.first!.split(separator: "=").last!.map { String($0) }
//            let authToken = String(accessT.first!.split(separator: "=").last!)
//            print(authToken2)
//            print(authToken)
//
//            var localPersistanceStore = LocalPersistenceStore()
//            localPersistanceStore.spotifyToken = authToken
//            localPersistanceStore.spotifyTokenTimestamp = Date().timeIntervalSince1970
//
//            let store = Store(initialState: buildAppState(version: AppVersion.appVersion),
//                              reducer: AppReducer().main,
//                              environment: buildAppEnvironment(with: authToken))
//
//            if let windowScene = scene as? UIWindowScene {
//                let window = UIWindow(windowScene: windowScene)
//                window.rootViewController = UIHostingController(rootView: MyAlbumsView(store: store))
//                self.window = window
//                window.makeKeyAndVisible()
//            }
//        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
