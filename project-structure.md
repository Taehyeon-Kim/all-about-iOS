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
하지만 iOS13부터는 'window'의 개념이 'scene'으로 바뀌고 위의 역할 중 일부를 하지 않게 되었다.
앱 UI의 생명 주기를 관리하는 것은 뒤에서 설명할 SceneDelegate의 역할이 되었다.
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
<br>

**`🍏 ViewController.swift`**  

**뷰(View)에서 처리하는 내용을 담고 있는 클래스 파일이다.**  
뷰 당 각각의 클래스가 대응되기 때문에, 새롭게 뷰를 만들때마다 클래스 파일도 추가를 해서 연결해주어야 한다.

**1. 주요 역할**
- 일반적으로 기본 데이터의 변경에 대한 응답으로 뷰의 콘텐츠를 업데이트한다.
- 뷰와 사용자 상호 작용에 응답한다.
- 뷰의 크기 조정 및 전체 인터페이스의 레이아웃을 관리한다.
- 앱에서 다른 뷰 컨트롤러를 포함한 다른 객체(Object)를 조정한다.

**2. 뷰 컨트롤러의 타입**
1. Content View Controller
2. Container View Controller (`NavigationViewController`, `TabBarViewController`) 

**3. 생명 주기**

생명 주기에 대해서는 따로 정리를 하도록 하고,  
여기서는 ViewController.swift 파일에서 확인할 수 있는 `viewDidLoad()`만 알아보도록 한다.
- `viewDidLoad()` : 뷰 계층을 메모리에 로드한 직후 수행된다. 주로 뷰의 초기화 작업을 담당한다.
- `viewWillAppear()`
- `viewDidappear()`
- `viewWillDisappear()`
- `viewDidDisappear()`

<br>

**`🍏 Main.storyboard`**

**정말 간단하게 말해서 스토리보드는 앱의 UI를 디자인 하는 공간이다.**  
프로젝트를 처음 생성하면 Main.storyboard와 Launch.storyboard 이 2가지의 스토리보드만 존재한다.  

```
프로젝트 진행 시 하나의 스토리보드에 많은 뷰가 생기기 마련이고 복잡해질 수 밖에 없다.
스토리보드를 여러 개로 분리하여 사용하는 방법이 좋을 것으로 보인다. (물론 정답은 아님)
```

<br>

**`🍏 LaunchScreen.storyboard`**

**앱이 처음 실행될 때 표시되는 화면이다.** 이를 스플래시(Splash)화면이라고 부르기도 한다.


<br>

**`🍏 /Assets.xcassets`**

**앱의 에셋을 관리하는 폴더이다. 이를 에셋 카탈로그라고 부른다.**  
에셋과 다양한 디바이스의 속성에 대한 파일의 연결을 통해 앱이 리소스(실행할 때 사용하는 이미지 또는 음악)에 쉽게 접근할 수 있도록 해준다.  
디바이스 속성은 디바이스의 특징, 사이즈 클래스, 주문형 리소스, 특정 타입의 정보를 포함한다.

**1. 구분**
- 에셋 카탈로그 폴더
- 컨텐츠 파일 : 이미지, 음악 등의 리소스 파일
- JSON 파일 : 해당 속성에 대한 정보를 포함하고 있는 JSON vkdlf

**2. 에셋 카탈로그 종류**

|   종류  |    설명   | 확장자 |
| ----    | ---- | ---- |
|    `App Icon Type`  |    앱 아이콘에 사용되는 이미지  |.appiconset|
|    `Image Set Type`   |   객체가 사용하는 이미지 파일   |.imageset|
|    `Data Set Type`   |   객체가 사용하는 모든 종류의 파일(실행파일을 제외한 바이너리 파일)   |.dataset|
|  `Launch Image Type`   |   어플리케이션이 실행될 때 사용되는 이미지 파일   |.launchimage|




