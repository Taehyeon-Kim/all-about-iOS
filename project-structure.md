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
