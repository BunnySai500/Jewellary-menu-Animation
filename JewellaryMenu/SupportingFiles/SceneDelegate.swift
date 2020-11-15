 

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {


    var appRouter: AppRouter?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let wscene = (scene as? UIWindowScene) else { return }
        let win = UIWindow(windowScene: wscene)
        appRouter  = AppRouter(win)
        appRouter?.initiateNavigation()
    }

     
}

