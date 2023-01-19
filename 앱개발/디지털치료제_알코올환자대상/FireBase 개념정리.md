# FireBase 개념정리

---

1. data type

   - Firebase의 data type은 Map이다.

2. 저장형태 

   - Firebase는 컬렉션 형태로 저장되며, 이 컬랙션은 document(문서) 형태로 저장된다.

   - 컬랙션안에 문서(doc)가 있고, 문서안에 필드가 있다. 필드안에 데이터가 저장된다.

3. Provider

   - stream하면서 사용
     - 데이터의 통로 같은 것, 데이터 전역에서 사용하고자 할 경우 이용

4. Pub.dev 에서 install 할것들

   - firebase_auth
     - irebase auth 이용시 기본설정
   - cloud_firestore. 
     - firebase store 이용시 기본설정
   - 연동한것들을 pubspec.yaml에 추가해줌

5. Firebase이용방법

   1. Firebase 에 프로젝트를 생성한다.
   2. Android 문양을 선택한다.
      - Android 패키지이름은 파일에서 만든 패키지 이름으로 사용한다.
      - android studio ->android디렉토리 -> app -> build.gradle -> applicationId 에서 확인할 수 있다.
   3. Build.gradle 열면 에러남. -> <에러 발생시 처리 방법> 으로 이동
   4. applicationID “com.xxx~” 의 형태인 것을 firebase프로젝트 생성시 기입한다.

6. 구성파일 다운로드

   - android studio 프로젝트의 app 디렉토리에 추가

7. 플러그인 설치 

   1. 'com.google.gms.google-services' 과 같은 형태를 복사해서 android studio 로 이동 
   2. app 파일 안에 있는 build.gradle이 아닌 android 디렉토리에 있는 build.gradle 선택 
   3. classpath 밑에 추가

8. Firebase 에서 데이터 가져오기

   1. App.js에서 Const db = firebase.firestore(); => db.setting({timestampInSnapshots : true});

      - db변수 생성 및 셋팅한다.

   2. db 변수 이용해서 테이블 이름으로 된 doc 정보들 모두 가져오기 

      - 예시 코드 
        - db.collection(‘cafes’).get().then( (snapshot) => { snapshot.docs.forEach(doc => { console.log( doc.data()) }) })

      1. doc(문서)의 형태로 가져와서 data 해줘야함
      2. then()은 데이터를 가공해서 가져오기 위함이다.
      3. 이때 doc.id 이 문서를 뜻하고, doc.data().name 이 해당 문서안의 필드에 있는 정보를 뜻한다.

   3. 조건이용

      - Db.collection(‘cafes’).where(‘name’, ‘==’, ‘wonyoung’).get().then( (snapshot) => {….});

   4. 정렬해서 가져오기 => 정렬하려면 firebase에서 index 설정을 해줘야 오류가 안난다.

      - DB.collection(‘cafes’).where( 조건).orderBy(‘name’).get().then(…);

9. fireBase에 데이터 저장

   - db.collection(‘cafes’).add({ name : form.name.value });

10. firebase 데이터 삭제

    - db.collection(‘cafes’).doc(id).delete();
    - Collection.doc()은 단일 문서를 찾는 역할을 한다.
      - id를 지우면 해당 문서가 지워져서 안에있는 데이터(필드)들이 삭제된다 .

11. Firebase의 내용을 실시간으로 반영

    - ```dart
      db.collection('cafes').orderBy('city').onSnapshot(snapshot => {
              let changes = snapshot.docChanges();
              changes.forEach(change => {
                      if(change.type == ‘added’){
                          첫 화면 호출
                      }
                      Else if(change.type == ‘removed’){
                          삭제할 곳
                      }
                  }
                )
          }
      )
      ```

12. firebase 업데이트

    - db.collection(‘cafes’).doc( 해당문서ID).update({ name: ‘change_name’});
    - db.collection(‘cafes’).doc( 해당문서ID).set ({ name: ‘change_name’});
      - 업데이트가 아니라 새로 정의하는 방법
      - 이때 해당 문서 안의 데이터가 name 빼고 다 지워진다.