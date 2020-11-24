## Autolayout(오토레이아웃)

- **기존의 Frame-Based Layout과 다른 View들 간의 관계를 이용하여 View의 위치와 크기를 자동으로 결정하는 Layout System**  
- **관계는 constraint로 설정이 가능**

### 1. 간단한 개념
Device마다 자동으로 계산하여 view를 그려준다. (`뷰의 위치 + 뷰의 크기` → `오토레이아웃` → `화면 렌더링`)
![autolayout-1](https://user-images.githubusercontent.com/61109660/100137046-32c7e080-2ecf-11eb-84ef-8308deb42d3a.jpg)

### 2. View 간의 관계
- `leading` `trailing` `top` `bottom` 등의 관계(Constraint)를 설정할 수 있다.
- `Conflicting Constraints` : 각각의 관계 또는 제약이 충돌나는 경우가 발생할 수 있다. 
![autolayout-2](https://user-images.githubusercontent.com/61109660/100137044-322f4a00-2ecf-11eb-82b5-55c765b743c2.jpg)

### 3. Self Sizing
- `Label`의 경우 크기가 정해져 있지만, `View`의 경우 크기가 정해져 있지 않다.
- `View`의 높이를 설정하지 않아도 되는 이유는 Label과 View의 관계로 자연스럽게 높이를 알 수 있기 때문이다. 
- 자동으로 높이가 조절되는 `View`를 볼 수 있다.
![autolayout-3](https://user-images.githubusercontent.com/61109660/100137043-3196b380-2ecf-11eb-8de0-cf15716f3768.jpg)

### 4. Dynamic Table View
- 오토레이아웃을 응용해서 셀의 크기가 조절되는 테이블 뷰를 만들 수 있다.
![autolayout-4](https://user-images.githubusercontent.com/61109660/100137040-30fe1d00-2ecf-11eb-9243-086dd5dbfd30.jpg)

### 5. Constraint Priority (제약 우선순위)
- Hugging : 우선순위가 높은 쪽으로 낮은 쪽의 컴포넌트가 당겨진다.
- Compression Resistance : 우선순위 높은 쪽의 컨텐츠를 최대한 확보한다. Hugging과 반대로 밀어내는 것을 볼 수 있다.
- 우선순위 범위 : `0 ~ 1000`
![autolayout-5](https://user-images.githubusercontent.com/61109660/100137037-2fccf000-2ecf-11eb-8415-b43a86354f30.jpg)

### 6. Stack View
- 스택 뷰를 이용해서도 오토레이아웃을 잘 다룰 수 있다.
![autolayout-6](https://user-images.githubusercontent.com/61109660/100137025-2ba0d280-2ecf-11eb-838d-af36f019d81d.jpg)

### +) Reference
- 최애하는 개발 유튜브 [개발하는 정대리 유튜브](https://www.youtube.com/channel/UCutO2H_AVmWHbzvE92rpxj)를 많이 참고했다.
- 추가적으로 [Zedd님 블로그](https://zeddios.tistory.com/380)에 가보면 오토레이아웃에 대해 잘 정리되어 있다.
