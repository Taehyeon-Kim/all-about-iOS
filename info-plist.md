## Info.plist (Information Property List)

번들을 식별하고 구성하는 키-값 쌍이 포함 된 리소스이다.  
앱에 대한 설정을 할 수 있는 파일이라고 이해하면 편할 것 같다.

### Info.plist - Basic Setting(기본 세팅)

|   키(KEY)  |    타입(TYPE)   | 설명(DESCRIPTION) |
| ---- | ---- | ---- |
|Localization native development region|`string`|번들의 주 언어 또는 주 지역 설정|
|Executable file|`string`|번들의 메인 실행 파일 이름|
|Bundle identifier|`string`|애플리케이션을 구분하는 유일한 ID <br> `번들의 앱의 타입을 결정하고 A-Z, a-z, dot(.), hyphen(-)을 이용해 DNS를 거꾸로 쓴 형식을 사용해야 한다.`|
|infoDictionary version|`string`|Info.plist에 대한 버전 정보 <br> `Xcode가 자동 설정해준다고 한다. (20년 11월 기준 6.0로 설정)`|
|Bundle name|`string`|번들의 짧은 표시 이름 <br> `이 이름은 16자 미만이어야 하고, 메뉴바나 애플리케이션 정보창에 표기가 적합해야 한다.` <br> `대부분 BundleDisplayName과 동일하다고 한다.`|
|Bundle OS Type code|`string`|번들의 타입을 설정 <br> `이 키는 번들 유형에 대한 4자 코드로 구성` <br> `앱의 경우 코드는 APPL, 프레임워크의 경우 FMWK, 번들의 경우 BNDL이다.` <br> `기본값은 번들 확장에서 파생되거나 파생할 수 없는 경우 기본값은 BNDL이다.`|
|Bundle version string (short)|`string`|번들의 릴리즈 버전만을 표현하는 데 사용|
|Bundle version string|`string`|번들의 빌드 버전을 표현하는 데 사용(iOS, OS X에서 릴리즈 된 혹은 아직 안된 앱 번들의 빌드 버전 정의)<br> `빌드 버전 번호는 첫 번째 정수가 0(예: 3.1.2)보다 큰 세 개의 음수가 아닌 기간으로 구분된 정수로 구성된 문자열이어야 한다. 문자열은 숫자(0-9) 및 마침표(.) 문자만 포함해야 한다. 선행 0은 각 정수로 잘라서 무시된다(즉, 1.02.3은 1.2.3과 동일). 각 원소의 뜻은 다음과 같다.`|
|Application requires iPhone environment|`boolean`|iOS앱에서만 실행할 것인지 명시 <br> `(YES -iOS앱에서만 실행)`|
|▶︎ Application Scene Manifest|`dictionary`|`(iOS 13.0+)` 앱의 scene 기반 라이프사이클 지원에 대한 정보<br> `이 키가 존재한다는 것은 앱이 scene을 지원하고 App Delegate 개체를 사용하여 화면이나 배경으로의 전환을 관리하지 않는다는 것을 나타낸다.`|
|Configuration Name|`string`|scene을 식별하는 데 사용하는 앱별 이름<br> `모든 scene 구성에 고유한 이름을 할당하여 앱에서 구분한다. 요청된 구성을 식별하려면 App Delegate의 메서드에서 이 이름을 사용한다.`|
|Delegate Class Name|`string`|UIKit이 인스턴스화하고 Scene Delegate Object로 사용하도록 하려는 앱 별 클래스의 이름 <br> `이 키에 지정하는 클래스는 UISceneDelegate 프로토콜을 채택해야 한다.`|
|Storyboard Name|`string`|장면의 초기 사용자 인터페이스를 포함하는 스토리 보드 파일의 이름|
|Application supports indirect input events|`boolean`|`(iOS 13.4+)` 앱이 간접 입력(터치, 회전) 메커니즘을 지원함을 나타내는 bool 값|
|Launch screen interface file base name|`string`|앱의 시작 이미지를 생성할 스토리 보드의 파일 이름 <br> `LaunchScreen.(storyboard)`|
|Main storyboard file base name|`string`|앱의 메인 스토리보드 파일 이름 <br> `Main.(storyboard)`|
|▶︎ Required device capabilities|`array`|앱을 실행하는 데 필요한 기기 관련 기능 <br> `App Store는 UIRequiredDeviceCapabilities(영문) 속성 목록 키의 값을 사용해 앱에 필요한 하드웨어 및 특정 기능을 확인하여 사용자가 해당 기기에서 지원하는 앱만 다운로드할 수 있도록 함`|
|▶︎ Supported interface orientations|`array`|iOS 화면 회전 처리에 사용 (앱의 기본적인 전체 방향 설정) <br> `디폴트 값으로 세가지 모드 지원` <br> Portrait(bottom home button) - 세로 모드 <br> Landscape (right home button) - 좌측 회전 <br> Landscape (left home button) - 우측 회전|
|▶︎ Supported interface orientations (iPad)|`array`|iPad 화면 회전 처리에 사용 (앱의 기본적인 전체 방향 설정) <br> `디폴트 값으로 세가지 모드를 제외한 추가 모드 지원` <br> Portrait(bottom home button) - 거꾸로 든 세로 모드|






