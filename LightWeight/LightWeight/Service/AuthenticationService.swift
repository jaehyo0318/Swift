//
//  AuthenticationService.swift
//  LightWeight
//
//  Created by  서재효 on 4/1/24.
//

import Foundation
import Combine
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser


enum AuthenticationError: Error {
    case clientIDError
    case tokenError
    case invalidated
}

protocol AuthenticationServiceType {
    func checkAuthenticationState() -> String?
    func signInWithGoogle() -> AnyPublisher<User, ServiceError>
    func signInWithKakao() -> AnyPublisher<User, ServiceError>
    func logout() -> AnyPublisher<Void, ServiceError>
}

class AuthenticationService: AuthenticationServiceType {
    
    func checkAuthenticationState() -> String? {
        if let user = Auth.auth().currentUser {
            return user.uid
        } else {
            return nil
        }
    }
    
    
    func signInWithGoogle() -> AnyPublisher<User, ServiceError> {
        Future { [weak self] promise in
            self?.signInWithGoogle { result in
                switch result {
                case let .success(user):
                    promise(.success(user))
                case let .failure(error):
                    promise(.failure(.error(error)))
                }
            
            }
        }.eraseToAnyPublisher()
    }
    
    func signInWithKakao() -> AnyPublisher<User, ServiceError> {
        Future { [weak self] promise in
            self?.signInWithKakao() { result in
                switch result {
                case let .success(user):
                    promise(.success(user))
                case let .failure(error):
                    promise(.failure(.error(error)))
                }
            
            }
        }.eraseToAnyPublisher()
        
    }
    
    func logout() -> AnyPublisher<Void, ServiceError> {
        Future { promise in
            do {
                try Auth.auth().signOut()
                promise(.success(()))
            } catch {
                promise(.failure(.error(error)))
            }
        }.eraseToAnyPublisher()
    }
    
}

extension AuthenticationService {
    
    private func signInWithGoogle(completion: @escaping (Result<User, Error>) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(.failure(AuthenticationError.clientIDError))
            return
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) {  [weak self] result, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                completion(.failure(AuthenticationError.tokenError))
                return
            }
            
            let accessToken = user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            self?.authenticateUserWithFirebase(credential: credential, completion: completion)
        }
    }
    
    private func authenticateUserWithFirebase(credential: AuthCredential, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(with: credential) { result, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let result else {
                completion(.failure(AuthenticationError.invalidated))
                return
            }
            
            let firebaseUser = result.user
            let user: User = .init(id: firebaseUser.uid,
                                   name: firebaseUser.displayName ?? "",
                                   phoneNumber: firebaseUser.phoneNumber,
                                   profileURL: firebaseUser.photoURL?.absoluteString)
            
            completion(.success(user))
            
            
            
        }
    }
    
    private func signInWithKakao(completion: @escaping (Result<User, Error>) -> Void) {
        if AuthApi.hasToken() {
            UserApi.shared.accessTokenInfo { _, error in
                if let error {
                    self.openKakaoService(completion: completion)
                } else {
                    self.loadingInfoDidKakaoAuth(completion: completion)
                }
            }
        } else {
            self.openKakaoService(completion: completion)
        }
    }
    
    private func openKakaoService(completion: @escaping (Result<User, Error>) -> Void) {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error {
                    completion(.failure(error))
                    return
                }
                _ = oauthToken
                self.loadingInfoDidKakaoAuth(completion: completion)
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                _ = oauthToken
                self.loadingInfoDidKakaoAuth(completion: completion)
            }
        }
    }
    
    private func loadingInfoDidKakaoAuth(completion: @escaping (Result<User, Error>) -> Void) {
        UserApi.shared.me { [ weak self ] kakaoUser, error in
            if let error {
                completion(.failure(error))
                
                return
            }
            
            guard let email = kakaoUser?.kakaoAccount?.email else { return }
            guard let password = kakaoUser?.id else { return }
            guard let userName = kakaoUser?.kakaoAccount?.profile?.nickname else { return }
            
            self?.emailAuthSignUp(email: email, userName: userName, password: "\(password)", completion: completion)
        }
    }
    
    private func emailAuthSignUp(email: String, userName: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if result != nil {
                let chageRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                chageRequest?.displayName = userName
            }
            
            Auth.auth().signIn(withEmail: email, password: "\(password)") { result, error in
                if let error {
                    completion(.failure(error))
                    return
                }
                
                guard let result else {
                    return
                }
                
                let firebaseUser = result.user
                let user: User = .init(id: firebaseUser.uid,
                                       name: firebaseUser.displayName ?? "",
                                       phoneNumber: firebaseUser.phoneNumber,
                                       profileURL: firebaseUser.photoURL?.absoluteString)
                completion(.success(user))
                
            }
        }
    }
}

class StubAuthenticationService: AuthenticationServiceType {
    
    
    func checkAuthenticationState() -> String? {
        return nil
    }
    
    func signInWithGoogle() -> AnyPublisher<User, ServiceError> {
        Empty().eraseToAnyPublisher()
    }
    
    func signInWithKakao() -> AnyPublisher<User, ServiceError> {
        Empty().eraseToAnyPublisher()
    }
    
    func logout() -> AnyPublisher<Void, ServiceError> {
        Empty().eraseToAnyPublisher()
    }
}
