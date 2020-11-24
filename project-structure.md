## 프로젝트 구조 (Project Structure)

프로젝트를 만들면 기본적으로 생성되는 파일 및 폴더 구조가 있다. <br>
각각의 파일과 폴더가 무엇을 의미하는지 알아보도록 하자. <br>

---

### 🗂 프로젝트 구조 화면

<img width="270" alt="스크린샷 2020-11-24 오후 7 03 53" src="https://user-images.githubusercontent.com/61109660/100079403-f6bd5d00-2e87-11eb-8592-e91f8ac42a75.png">

<br>

**`🍏 AppDelegate.swift`**

**(~iOS12) AppDelegate.swift 파일은 2가지 주요한 기능을 담당했다.**

**1. AppDelegate 클래스를 정의한다.**

- 앱의 컨텐츠(내용)이 그려지는 창(window)를 만든다.
- 앱 안에서 상태 변화에 반응(응답)한다.

**2. 진입 점(entry point)과 입력 이벤트(input events)를 앱에 전달하는 run loop를 생성한다.**

- UIApplicationMain속성에 의해 수행된다. (상단 @UIApplicationMain)
- UIApplicationMain속성에 대한 응답으로 응용프로그램 객체(application object)를 생성한다.
- 응용프로그램 객체는 앱의 생명주기를 관리한다.
- 시스템이 AppDelegate클래스의 인스턴스를 생성하고 이를 응용프로그램 객체에 할당한다.
- 위의 작업을 마치면 시스템은 앱을 실행한다.

**+) 단일 프로퍼티 : window**
```swift
var window : UIWindow?
```
이 프로퍼티는 앱의 창(window)에 대한 참조를 저장한다. 이 창(window)이란 것이 앱의 뷰 구조의 루트를 나타낸다.  
**쉽게 말해서, 앱 콘텐츠가 그려지는 곳을 의미한다.** Optional로 선언되어 있기 때문에 어떨 때는 값을 가지지 않을 수 있다.  

**﹡요약(Summary)**  
```
AppDelegate의 역할이 앱의 생명 주기를 관리하고 앱 상태(App State)의 전환 동안의 작업을 처리하는 것이다.
하지만 iOS13부터는 'window'의 개념이 'scene`으로 바뀌고' 위의 역할을 더 이상 하지 않게 되었다.
앱의 생명 주기를 관리하는 것은 뒤에서 설명할 SceneDelegate의 역할이 되었다.
```
<br>

**`🍏 SceneDelegate.swift`**  

**(iOS13~) 프로젝트를 생성하면 SceneDelegate.swift 파일이 자동적으로 생성된다.**  
iOS, 특히 `iPadOS`에서 멀티 윈도우를 사용할 수 있게 되면서 나오게 되었다고 봐도 좋을 것 같다.

**1. Scene 이란**

[APPLE DOCS - Session](https://developer.apple.com/documentation/uikit/app_and_environment/scenes)에 나와있는 `Scene`의 설명을 보면,  
`Scene`은 앱 UI의 여러 인스턴스를 동시에 관리하고 리소스를 적절한 UI 인스턴스로 연결하는 것을 알 수 있다.

추가로 DOCS의 내용을 정리하면,
- `Scene`에는 UI의 한 인스턴스를 표시하기 위한 창(window) 및 뷰 컨트롤러(View Controller)가 포함되어 있다.
- 각 `Scene`에는 UIkit과 앱 간의 상호 작용을 조정하는데 사용하는 UIWindowSceneDelegate 객체가 있다.
- `Scene`은 동일한 메모리 및 앱 프로세스 공간을 공유하면서 동시에 실행된다.
- 이로써, 단일 앱이 여러 `Scene`과 `Scene Delegate Object`를 동시에 활성화할 수 있다.

**2. Scene Delegate의 역할**

UI의 생명 주기(Life Cycle)를 관리하는 역할이 `AppDelegate`에서 `SceneDelegate`로 넘어왔다.

**3. Scene Session 이란**

[APPLE DOCS - Scene Session](https://developer.apple.com/documentation/uikit/app_and_environment/scenes)에 나와있는 설명은 다음과 같다.  
사용자가 앱에 새로운 `scene`을 추가하거나 프로그래밍적으로 `scene`을 요청하면 시스탬이 `session`객체를 생성하여 그 `scene`을 추적한다.    
`session`에는 고유한 식별자와 `scene`의 구성 세부 정보가 포함되어 있다.

**4. 사용되는 메서드**

- Scene이 앱에 추가될 때 호출
```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
```
- Scene의 연결이 해제될 때 호출, 다시 연결될 수 있음
```swift
func sceneDidDisconnect(_ scene: UIScene)
```
- Scene과 상호 작용이 시작될 때 호출 (ex. App Switcher에서 선택)
```swift
func sceneDidBecomeActive(_ scene: UIScene)
```
- Scene과 상호 작용을 중지할 때 호출, Scene이 Background로 진입할 때 호출 (ex.다른 앱 실행)
```swift
func sceneWillResignActive(_ scene: UIScene)
```
- Scene이 Foreground로 진입할 때 호출 (ex. background - foreground, 처음 활성화 시)
```swift
func sceneWillEnterForeground(_ scene: UIScene)
```
- Scene이 Background일 때 호출
```swift
func sceneDidEnterBackground(_ scene: UIScene)
```



