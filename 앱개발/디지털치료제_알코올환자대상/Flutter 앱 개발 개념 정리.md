# Flutter 앱 개발 개념 정리 

---

1. outline 안보일때 

   - ctrl 누르고 widget 클릭

2. => 의 기능 

   - 함수호출에 사용
   - {} 는 같은 기능을 한다

3. Dynamic 

   - 변수에 어떤값이 올지 모를 때 사용함. 할당된 변수값의 종류에 영향없이 타입이 변경된다.

4. Initstate 

   - 위젯의 생성자 코드 실행이후 처음으로 실행되는 메서드
   - 만약 구동이 에러가 없는데 구동 안되는거면 애뮬레이터 용량문제일수 있다. ADB 삭제 후 다시 만들거나 edit 들어가서 internal Storage를 4096으로 늘린다.
     - File -> project counstruct -> project JDK -> android studio default

5. scaffold 의미 

   - 앱의 시작을 알리는 위젯. 모두다 여기서 시작함
   - 스케폴드 안에서 화면 구성이 이루어진다.

6. late 사용 이유

   - 변수 생성시 초기화로 late를 해줘야한다. 
   - 플러터는 null 값을 구분해 줘야함

7. required 의미 

   - 반드시 기록이 되어야 하는 변수를 만들 때 사용
   - 데이터가 무조건 필요한 할 변수에 적용 시킴
   - 해당 키워드 적용시킴으로써 필수요소 데이터 입력확인 시 에러를 검출할 수 있다. 

8. final과 const 

   - 사용하는 이유
     - 변경하지 못하게 하는 것도 있지만, 컴파일 시 매번 컴파일 하지 않아도 되는 내용이라고 알려줘서 더 빠르게 컴파일을 할 수 있게 만들기 위함이다.

9. SafeArea

   - 안전영역을 의미하며, 앱 바에서 표시되지 않고, 앱 바의 밑을 영역으로 사용한다.
   - Scaffold( body: SafeArea(...))  의 형태로 사용

10. State

    - state란 앱에서 사용되는 data를 의미
    - State는 위젯의 상태를 저장하며 위젯이 생성될 때(위젯이 화면에 그려질 때) 위젯의 속성을 유지하는 객체이다.
      - 예를 들어 CheckBox 위젯을 클릭하여 체크박스의 상태를 변경하면 변경된 상태는 State 객체에 유지됩니다. 
    - 종류
      - app state : 앱 전반에 걸쳐 사용되는 data
      - widget state : 위젯 내부에서만 사용되는 data
      - statelessWidget : 변경될 data가 없다.
      - setState( () {} ) => 부모 state를 호출한다. stateful 에서만 사용됨

11. stateless vs stateful

    -  페이지 이동할때마다 위젯 초기화 일어난다. 
       - **stateless위젯**은 고정된 화면으로 **초기 한번의 위젯 초기화 시에만 리로드** 된다. 
         - 가게 안내, 메뉴 안내 화면처럼 사용자와 상호작용이 필요 없는 위젯을 만들때 사용한다. 
       - **stateful 위젯**은 변경될 수 있는 부분으로, **위젯 초기화 시 다시 리로드**된다. 

    1. **stateless(상태유지하지 않음)**: 
       - **정적인 위젯**으로 , 상호작용을 하지 않고, 사용자에 의한 데이터의 변화가 없고 화면에 고정되어 있는 것
       - **화면이 로드될 때 변경하지 않아도 되어 한번만 그려지는 state가 없는 위젯**
         - 변경이 필요하지 않은 data로 구성되어있어 이벤트 또는 사용자와 상호작용하지 않는다.
    2. **stateful(상태유지)** : 
       - 위젯이 동작하는 동안 Data 변경이 필요한 경우 화면을 다시 그려서 변경된 부분을 위젯에 반영하는 동적인 위젯
       - State 객체를 이용하여 위젯을 변경한다. State 객체는 해당 위젯에 대한 모든 변경가능한 상태가 유지되는 곳이다. 
       - 데이터가 전송되어서 화면에 영향을 줄 경우나 버튼을 누르거나 행동을 취할때 사용한다.
         - 사용자의 사용에 따라 변경되는 곳에 사용 
       - ex) dispose(), bulid(), initstate(실행될 때 가장 먼저 실행되는 함수 )

12. 비동기식(async) 적용 

    - 데이터를 가져올 때 비동기식이 되면 안된다. 왜냐하면 데이터를 입력하고 가져오는 시간보다 출력시간이 빠르면 데이터가 없는것으로 간주하기 때문이다.

      - 따라서 **async 와 await 키워드를 사용해 동기식처럼 변경**해준다. 
      - `async`가 붙은 함수는 반드시 프라미스를 반환하고, 프라미스가 아닌 것은 프라미스로 감싸 반환하게된다.
      - `await` 키워드는 async 안에서 동작하며 프라미스가 처리될 때까지 기다리고 결과를 그 이후 반환한다.

    - ex)void getData() async{ String name = await Future.delayed(Duration(seconds : 3), (){ return 'won';}); 

      - name 변수에 won을 가져오고 3초간 기다린다.

    - 예시 

      ```java
      async function f() {
      
        let promise = new Promise((resolve, reject) => {
          setTimeout(() => resolve("완료!"), 1000)
        });
      
        let result = await promise; // 프라미스가 이행될 때까지 기다림 (*)
      
        alert(result); // "완료!"
      }
      ```

13. json 정보 크롤링 해오기

    1. get('주소') 메소드 이용해서 Response객체로 받는다. -> 주소 크롤링 하기 위해서는 pubspec.yaml 에다가 http 추가하고, import로 (package: http/http.dart ) 를 가져온다.
    2. 가져온 Response 객체는 문자열 형식으로, map 형식으로 바꿔서 사용해야 한다.
    3. Map data = jsonDecode(response.body); -> jsonDecode사용하기 위해서는 ( import 'dart: convert') 해줘야함
    4. print(data['title'])

14. Future<타입> 

    - 지금은 없지만 미래에 요청한 데이터 혹은 에러가 담길 그릇 
      - 해당 타입이 나온다는 것을 미리 알려주는 것으로, **비동기 함수에서 사용**된다.

15. 정렬 Row와 Column 의 정렬

    1. Row일때는 주축이 mainAxisAlignment 가 되서 가로를 기준으로 center에 정렬이 된다.
    2. Column일 경우 주축이 세로가 되서 세로화면을 기준으로 center로 정렬된다.

16. 위젯

    - 독립적으로 실행되는 작은 프로그램으로, 주로 바탕화면 등에서 날씨를 나타냄
    - Flutter는 모든 것이 위젯으로 이루어져 있어서, 위젯을 많이 알수록 많은 기능을 사용할 수 있다.

17. 실행순서

    - Myapp -> MaterialApp -> MyHomePage -> Scaffold -> Appvar or center 등등

18. Children vs child

    1. Children : 여러개의 자식위젯을 가질 경우
    2. Child : 한가지의 위젯을 사용할 경우

19. Container

    - 위젯을 하나로 묶는 역할을 함
    - row나 column같이 텍스트 배치에 유용

20. Pageview

    - 메인화면에서 화면 넘길 때 사용하는 것

21. sizedBox

    - 다음 컨텐츠 표시할 때 공백을 주기 위해서 사용

22. InkWell

    - onTap() 을 이용해서 눌려졌을때 어디로 이동하게 만듬

23. SingleChildScrollView

    - 스크롤 방향을 옆으로 줄 수 있는 것

24. Drawer

    - 메뉴바에 만들기

25. 폰트 스타일

    - 폰트 스타일은 dart파일에 저장해서 import로 불러온다
    - color: Color(그냥 변수로 사용하면 됨 )

26. BottomNavigationBar

    - 밑에 네비게이션 바 생성

27. 스크롤 기능

    - ListView 함수 사용 

28. Context 의미

    - Build 함수는 Scaffold 함수를 리턴할 때 widget tree상에서 어디에 위치하는지에 대한 정보를 context라는 변수에 넣어서 리턴해준다.

29. 로그인을 편하게 하는 방법 

    - firebase사이트 -> 빌드 -> authentication -> start -> 허용할 로그인 방법을 체크
    - AuthService클래스 생성해서 firebase_auth 패키지 import

30. UserCredential 로 로그인 체크 

    - 이때 시간이 많이 걸리니 async 이용해서 비동기처리 해줘야함( 비동기를 동기처럼 )

31. Provider

    - 모든 화면에서 데이터의 공유가 가능하게 하고 더 나아가 데이터의 변경이 발생하였을 시 해당 데이터를 참조하는 화면구성
      - 전역에서 쓰기 위해서는 MaterialApp 감싸면됨
    - 2개로 나눠진다. 데이터를 생산하는 곳, 데이터를 소비하는곳 (provider: 데이터 소비(가져오는 곳), StreamProvider: 데이터 생성)
    - 형태 : 데이터 생성 : streamprovider.value( value:생성할 값, child: Container(),)
    - 형태 : 데이터 소비 : var data Provider.of(context)

32. Snapshots()

    - stream 데이터를 얻을 때 사용

33. Streams

    - 데이터나 이벤트가 들어오는 통로이다. (비동기 이벤트)
    - 앱을 만들다보면 데이터 처리할 일이 많은데, 어느 타이밍에 데이터가 들어올지 확실히 알기가 어렵다.
      - Firestore에서의 변경사항을 즉각적으로 앱에 표시할 수 있다.
    - Snapshot 이용
      - 순간순간 업데이트 된 data 라고 생각하면 됨
    - Ex ) 네트워크에서 데이터를 받아와서 ui에 보여주는 상황일경우, 속도차이로인해 언제 데이터를 다 받을지 모른다. 이때 스트림은 데이터를 만드는 곳과 소비하는 곳을 따로둬서 문제를 해결
    - 순서
      - 데이터 만들기(변경) -> 연결 -> 데이터 처리
    - Map형식을 사용해서 다룰 수 있다.

34. StreamProvider vs SteamBuilder

    1. Streambuilder()
       - 스트림에서 이벤트가 나올때마다 문장을 재생성하여 가장 최신의 이벤트로 작업할 수 있게 해준다.
         1. Stream : 스트림 빌더에 쓰일 스트림을 정한다.
         2. Builder : 스트림 데이터를 받아 UI를 그리는 일을 한다.
    2. StreamProvider
       - streamController() : 여러 스트림을 관리하는 것으로, 데이터가 추가되거나 이벤트 종료시 실행된다.

35. TextFormField

    - text를 입력할수 있는 form을 만들어준다.
    - 속성
      - Decoration : InputDecoration() : 텍스트 필드를 꾸며준다.
        - 하나의 클래스를 만들어서 공통으로 스타일을 적용
      - Validator : 유효성검사
      - onChanged : 내용이 입력됐을 경우 setState로 전역변수에 값 전달
      - decoration: InputDecoration( 꾸밀 내용).copyWith(hintText: ‘아메리카노’),

36. 유효성 검사

    - 로그인시 이메일이 맞는지, 글자수 맞는지 판단가능
    - Validate() 메소드 이용
    - 비밀번호 * 처리 하는 방법 : obscureText : true,

37. FirebaseAuth user에 대한 처리 

    - FirebaseAuth 위젯에서는 User에 대한 변화를 stream을 통해 전송한다.
    - 사용 객체 
      - UserCredential
        - firebase_auth에 있는 객체로, firebase의 객체를 받아올 때 사용
      - createUserWithEmailAndPassword( email: email, password: password)
        - 신규 사용자를 생성
      - signInWithEmailAndPassword( email: email, password: password)
        - 생성된 사용자인지 확인

38. firestore 이용 개념 

    - 데이터를 컬렉션으로 저장하는 저장소 -> db와 같다고 보면 됨
      - 사용자가 회원가입할 때 생성되는 uid를 이용해서 firestore에 저장한다.
      - 저장형태는 databaseService 클래스를 만들고, 그 클래스의 생성자로 uid를 넘긴다.
    - DatabaseService 클래스는 컬랙션을 만들고, CollectionReference 와 FirebaseFirestore 객체 이용
      - 생성자로 받아온 uid를 이용해 같이 넘어온 매개변수로 고유한 사용자 정보들을 저장한다.
      - (생성한컬랙션명).doc(uid).set({ ‘저장명’: 매개변수1, ‘저장명’: 매개변수2})
    - Firestore 에서 가져오는 형태가 map이기 때문에 .toList()로 해줘야 한다.

39. ListTile 위젯

    - 화면에 타일 모양으로 표시
    - 속성
      - Leading : CirecleAvatar
      - Title : 첫 줄 텍스트
      - subtitle : 2번째줄 텍스트

40. GlobalKey

    - Form의 ID값으로 사용된다.
    - _formKey.currentState.validate() 의 형태로 사용되며 폼 내부의 모든 자식들의 validator가 실행
    - 위젯이 상태를 잃지 않으면서 부모를 바꿀 수 있도록 한다.
    - 특정 위젯의 정보를 완전히 다른 위젯 트리에서 접근 가능하게 해줄 수 있다. -> 비밀번호검사에 사용

41. DropdownButtonFormField()

    - 드롭다운 형태로 나오게 함

42. Slider 

    - 슬라이드 형식으로 값을 표현 
    - 색을 이용해서 0이면 연하게, max면 진하게 설정가능

43. _currentStrength ?? userData.strength

    - ??는 널 연산자로, 널이 아니면 _currentStrength에다가 userDatastrength를 넣어준다.