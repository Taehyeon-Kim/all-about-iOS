## 스토리보드 컴포넌트

컴포넌트는 각종 라벨, 버튼 등을 포함한다.  
CMD+SHIFT+L 또는 우측 상단의 `+`버튼을 클릭해서 추가할 수 있다.  
각각의 컴포넌트에 대해서 정리하고자 한다.

### SET 1

|   이름  |    관련 클래스   | 설명 |
| ---- | ---- | ---- |
|Label|`UILabel`|읽기 전용 텍스트를 담음|
|Button|`UIButton`|탭 했을 때 액션을 보낼 수 있음|
|Segmented Control|`UISegmentedControl`|버튼들의 수평적 그룹 <br> 여러 세그먼트로 구성된 수평 컨트롤이며 <br> 각 세그먼트는 개별 버튼으로 작동|
|Text Field|`UITextField`|인터페이스에서 편집 가능한 텍스트 영역을 표시하는 개체 <br> 한 줄로 구성|
|Slider|`UISlider`|연속되는 범위 내에서 단일 값을 선택하는데 사용|
|Switch|`UISwitch`|On/Off 상태를 스위치 할 수 있음|
|Activity Indicator View|`UIActivityIndicatorView`|회전하는 상태바 <br> 퍼센티지를 알 수 없는 작업의 처리를 나타내는 데 사용 <br> ex. 로딩중 표시|
|Progress View|`UIProgressrView`|프로그래스바 <br> 빈 막대를 만든 뒤, 할당된 값을 기준으로 막대의 백분율을 채움|
|Page Control|`UIPageControl`|페이지 리스트를 통해 진행률 표시 <br> 하단에 가로로 점의 배열이 표시 <br> ex. 이미지 슬라이더 생각하면 편함|
|Stepper|`UIStepper`|`-/+버튼` <br> 값의 증감 표시 <br> 종종 증가되는 값을 나타내기 위해 레이블 또는 텍스트 필드와 결합|

### SET 2

|   이름  |    관련 클래스   | 설명 | 상세 설명 |
| ---- | ---- | ---- | ---- |
|Stack View|`UIStackView`|스택 뷰| UIStackView는 수평(horizontal) 또는 수직(vertical) 뷰의 스택을 만드는데 필요한 제약조건(constraint)를 만들거나 관리|
|Horizontal Stack View|`UIStackView`|수평 스택 뷰|스택에 수평적으로 뷰를 쌓아서 추가하거나 제거 가능|
|Vertical Stack View|`UIStackView`|수직 스택 뷰|스택에 수직적으로 뷰를 쌓아서 추가하거나 제거 가능|
|Table View|`UITableView`|테이블 뷰| 단일 열에 배열 된 행을 사용하여 데이터를 표시하는 뷰 |
|Table View Cell|`UITableViewCell`|테이블 뷰 셀|테이블 뷰에서 단일 행의 시각적 표현 <br> 한 행을 어떤 식으로 나타낼지를 결정|
|Image View|`UIImageView`|이미지 뷰| 단일 이미지 또는 일련의 애니메이션 이미지를 표시하는 개체|
|Collection View|`UICollectionView`|컬렉션 뷰| 정렬된 데이터 항목 모음을 관리하고 사용자 지정 가능한 레이아웃을 사용하여 표시하는 개체 <br> 테이블 뷰와 다르게 여러 개의 열 표현 가능|
|Collection View Cell|`UICollectionViewCell`|컬렉션 뷰 셀|컬렉션 뷰에 표현되는 하나의 항목 <br> 반복되는 셀 디자인 필요|
|Collection Reusable View|`UICollectionReusableView`|컬렉션 재사용 뷰|헤더와 푸터같이 컬렉션 뷰에서 재사용 되는 셀의 속성과 행동을 정의|
|Text View|`UITextView`|텍스트 뷰|여러 줄의 텍스트 컨텐츠를 편집할 수 있는 뷰|
|Scroll View|`UIScrollView`|스크롤 뷰|스크롤 가능한 범위를 정함 <br> 세로 또는 가로로 스크롤 방향을 결정할 수 있음|
|Date Picker|`UIDatePicker`|날짜 픽커(날짜 선택기)|날짜와 시간을 선택할 수 있는 뷰|
|Picker View|`UIPickerView`|픽커 뷰|하나 이상의 값들을 회전하는 행의 형태로 표현하는 뷰|

### SET 3

|   이름  |    관련 클래스   | 설명 |
| ---- | ---- | ---- |
|Visual Effect View with Blur|`string`||
|Map Kit View|`string`||
|MetalKit View|`string`||
|GLKit View|`string`||
|SceneKit View|`string`||
|SpriteKit View|`string`||
|ARKit View|`string`||
|Web View|`string`||
|WebKit View|`string`||
|RealityKit View|`string`||

### SET 4

|   이름  |    관련 클래스   | 설명 |상세 설명 |
| ---- | ---- | ---- | ---- |
|Navigation Bar|`UINavigationBar`|네비게이션 바|타이틀과 버튼(선택적)을 표시하는 상단바|
|Navigation Item|`UINavigationItem`|네비게이션 아이템|관련된 뷰 컨트롤러가 보여질 때 네비게이션 바가 표시하는 아이템 <br> 타이틀, 뒤로가기 버튼 등|
|Toolbar|`UIToolbar`|툴바|인터페이스 하단 가장자리를 따라 하나 이상의 버튼을 표시하는 컨트롤|
|Bar Button Item|`UIBarButtonItem`|바 버튼 아이템|팝 오버를 고정 할 바 버튼 항목 <br> 버튼과 유사하게 동작, 이미지 또는 텍스트를 포함 <br> ex) `+ 버튼`|
|Fixed Space Bar Button Item|`UIBarButtonItem`|고정 폭 버튼|지정된 거리만큼 왼쪽에서 여백을 주고 싶을 때 사용|
|Flexible Space Bar Button Item|`UIBarButtonItem`|가변 폭 버튼|빈 공간을 모두 채울 때 사용|
|Tab Bar|`UITabBar`|하단 탭 바|여러개의 뷰를 보여줄 수 있도록 하는 컨트롤러|
|Tab Bar Item|`UITabBarItem`|탭 바 아이템|탭 바에 들어가는 항목 <br> 이미지와 텍스트로 구성 <br> 뷰를 선택 가능|
|Search Bar|`UISearchBar`|검색 바| 사용자로부터 검색 관련 정보를 받기위한 뷰 <br> `텍스트 필드`, `검색 버튼`,`북마크 버튼`, `취소 버튼`제공|

### SET 5  
**→ 버튼을 누르면 메뉴 팝업을 나타낼 수 있다.**

|   이름  |    관련 클래스   | 설명 |
| ---- | ---- | ---- |
|Menu Command|`UICommand`|선택기에서 작업을 수행하는 메뉴 요소|
|Main Menu|`UIMenu`|메인 메뉴|
|Sub Menu|`UIMenu`|서브 메뉴|
|Inline Section Menu|`UIMenu`|인라인 섹션 메뉴|

### SET 6

|   이름  |    관련 클래스   | 설명 |
| ---- | ---- | ---- |
|View|`UIView`|빈 뷰|
|Container View|`UIContainerView`|view가 하위 view를 가질 수 있음 <br> 하위 view는 자체 view controller로 관리|
|View Controller|`UIViewController`|단일 뷰를 관리|
|Storyboard Reference|`UIViewController`|다른 스토리보드를 참조할 때 사용|

### SET 7  

|   이름  |    관련 클래스   | 설명 |
| ---- | ---- | ---- |
|Navigation Controller|`UINavigationController`|네비게이션 바와 뷰 컨트롤러의 스택을 관리|
|Table View Controller|`UITableViewController`|테이블 뷰를 관리 <br> 자동으로 테이블뷰의 delegate와 datasource를 가진 인스턴스를 생성|
|Collection View Controller|`UICollectionViewController`|컬렉션 뷰를 관리 <br> 자동으로 컬렉션 뷰를 가진 인스턴스를 생성|
|Tab Bar Controller|`UITabBarController`|다중 선택 인터페이스를 관리하는 컨테이너 뷰 컨트롤러 <br> 선택 항목에 따라 표시 할 하위 뷰 컨트롤러 결정|
|Split View Controller|`UISplitViewController`|하위 뷰 컨트롤러를 계층 인터페이스에서 관리하는 컨테이너 뷰 컨트롤러|
|Page View Controller|`UIPageViewController`|페이지 뷰를 관리|
|Hosting View Controller|`UIHostingController`|UIKit에 SwiftUI를 연결할 때 사용하는 컨트롤러|
|GLKit View Controller|`GLKViewController`|**`Deprecated`**|
|AVKit View Controller|`AVPlayerViewController`|비디오 재생되는 화면 <br> 시스템에서 제공하는 재생 컨트롤과 함께 플레이어 개체의 비디오 콘텐츠를 표시하는 뷰 컨트롤러|

### SET 8

|   이름  |    관련 클래스   | 설명 |
| ---- | ---- | ---- |
|Object|`string`||
|Tap Gesture Recognizer|`string`||
|Pinch Gesture Recognizer|`string`||
|Rotation Gesture Recognizer|`string`||
|Swipe Gesture Recognizer|`string`||
|Pan Gesture Recognizer|`string`||
|Screen Gesture Recognizer|`string`||
|Long Press Gesture Recognizer|`string`||
|Custom Gesture Recognizer|`string`||







