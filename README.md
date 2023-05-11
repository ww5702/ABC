# ABC
Are U Better than Chimpanzee?   
반응 속도 테스트의 ios앱 버전이다.   
   
***   
To Do List   
1. 화면을 너무 빠르게 누르면 초기화시키는 과정을 집어넣었는데   
몇초뒤에 시작시키려는 DispatchQueue함수가 이미 실행된 상태에서 초기화를 시키면 이미 선입력된 DispatchQueue함수가 자동으로 실행되는 오류   
~~2. 테스트들의 평균 통계적 자료들⚝(일단은 타 테스트 페이지의 통계를 캡쳐하여 진행)~~   
-> 테스트의 세밀한 통계등은 구할 수 없어서 평균치에 비교해 좋은 성적일수록 결과페이지의 결과 변경   
3. life 들이 전부 숫자로 되어있는데 하트 모양으로 가독성 좋게 바꾸기 (배열을 count해서 경우마다 하트 넣으면 될듯싶다)
4. VisualMemory 게임 버튼 예쁘게, 색이 흰색이나 파란색으로 바뀔때 애니메이션, 누를때마다 소리   
~~5. visualMemory 게임에서 타일이 변경되는 와중에 클릭을 하면 색이 안바뀐상태로 게임이 진행되는 문제~~   
~~6. 흰색으로 실행했을떄 게임 버튼이 흰색으로 바뀌는 경우의 가독성 저하~~   
-> stack과 view를 custom 색상으로 변경하여 가독성 향상   
~~7. vc1 -> modal -> vc2 -> navigation -> v3으로 verbalmemory 게임을 진행하는 도중 뒤로가기 앞으로가기를 여러번 했을떄 오류가 나는 경우~~   
-> 첫 단어부터 seen을 누를경우 나타나는 에러였는데 조건문을 둬 문제해결   
~~8. RETRY를 누를경우 navigation controller로 표기가 안되고 modal로 표시가 되는 오류~~   
-> 이 문제는 딱히 문제가 되지 않을것 같아서 해결하지 않음.   
-> 어차피 RETRY 버튼을 누른 이용자라면 게임을 다시 하려고 누른것일테니   
9. numbermemory 게임에서 만약 10자리 이상 외울경우 폰트를 작게 or 두줄로 처리   
~~10. 테스트 결과의 성적에 따른 이미지 출력 변형 처리 (상위 몇프로 -> 웃는사진, 등등)~~   
-> LottieAnimation을 통해 결과에 따른 트로피 애니메이션 차등 출력   
~~11. AimTrainer 버튼을 잘못눌렀을때 카운팅해서 정확도 측정 (탭 제스처로 시도해봤으나 실패)~~   
-> view 자체를 탭 제스처로 표현하니까 해결 가능했었다.   
~~12. AimTrainer 게임 시작시 시간초 눈에 보이게 표시~~   
13. ChimpTest 초기화 과정 정교화   
14. GameSelect VC에서 버튼 비율 정밀화(정사각형)   
15. 기록 1등 탈환시 이팩트(애니메이션 추가)   
~~16. DB Insert가 TEXT임에도 자동으로 BLOB으로 변경되어 저장되는 문제~~   
-> 입력되는 name을 NSString(string: name).utf8String으로 변환시켜 저장   
~~17. Navigation Controller를 통해 화면 전환시 기존의 데이터전달이 불가능했던 문제~~   
-> segue로 VC간의 데이터 전달로 해결 (prepare)   
18. Aim Trainer에 기록 넣는 column을 Int 에서 Double로 변경하여 기록을 초.밀리초 로 넣을것(추후 기록 비교를위해)   
***

vc1 -> (modal) -> vc2 -> (navigation) -> vc3   
https://dusanbaek.tistory.com/29   

   
-- 2023.03.14   
GameMainViewController Create   
CFAbsoluteTimeGetCurrent()를 통해 절대시간을 정하고 x1000을 해줌으로 ms 구하기 기능 구현   
touchLabel을 만들어 해당 label에 UITapGestureRecognizer()을 통해 label에 터치 이벤트를 구현.   
하지만 변화가 없다는 사실을 발견후 오류 해결   
   
<img width="260" alt="스크린샷 2023-03-14 오후 5 39 24" src="https://user-images.githubusercontent.com/60501045/224943805-63d3bb83-7023-4366-987b-f714f1d8f58d.png">   
   
User Interaction Enabled가 해제되어있어서 그렇다는 사실을 발견   
label이 안눌려있도록 되어있던거라 체크하여 해제   
   
-- 2023.03.15 ~ 2023.03.17   
GaimMainViewController -> ReactionGameViewController 로 변경   
GameSelectViewController Create(메인 화면 입장 시, 여러 게임 종류 선택 화면)   
ReactionGameViewController 여러 경우의수에 따른 함수나 변수 초기화   
TableView를 통해 5번의 기록 저장   
평균 반응속도를 화면에 출력   
   
-- 2023.03.20 ~ 2023.03.22  
VerbalMemoryViewController & VerbalMemoryScoreViewController Create   
영단어를 랜덤으로 출력하여 본적 있다면 SEEN 새로 본 단어라면 NEW를 눌러 암기력을 테스트하는 기능 구현   
결과 페이지에 점수 출력   

-- 2023.03.37 ~ 2023.04.04   
https://42kchoi.tistory.com/383   
하나의 뷰에서 세가지 뷰 컨트롤러 스위치하기   
-> 해당 기능으로 점수에 따른 3x3 4x4 5x5 VC변환   
http://yoonbumtae.com/?p=4786   
뷰 컨트롤러와 내부의 컨테이너 뷰 간의 데이터 교환   
해당 기능으로 정답을 맞췄을때의 score +1 이나   
정답을 틀렸을때 life -1 의 기능으로 수행   
   
변수 이동 순서   
gamestart 버튼 누르기 -> score와 isgamestart(bool)을 true로 변경 후 전송   
containerview에서 isgamestart가 true라면   
2레벨까지는 3x3게임을 진행하는 value를 가장 큰 조건문으로   
btnbool1,2,3들을 각각의 버튼에 생성 -> 버튼액션때 이상한 상황떄 누르는 경우를 방지하기 위해   
버튼이 흰색으로 바뀌면서 외워야 되는 버튼들을 표시해준뒤 1.5초 뒤에 다시 파란색으로 돌아가는데   
이때 isBtnColorChange = true를 입력해서 다 색이 변한뒤부터 버튼 액션이 눌러질수 있도록 설정   

0라이프 되었을 때의 기능 -> 점수페이지 이동   
3x3 다음 4x4, 5x5, 6x6 까지 기능    
일단 15단계까지 구현했으나 15단계이상 해결하게된다면 강제종료 혹은 7x7 까지 준비하진 않았다.   
   
-- 2023.04.06 ~ 2023.04.07   
NumberMemory Create.  
progress bar 이용   
https://velog.io/@sainkr/progress-view   
progress bar가 끝날때 -> firstContainer이동 -> 정답 맞추기 -> main이동 ->   
정답이 맞다면 정답페이지 보여주기 -> 다음레벨로 이동 / 틀렸다면 -> 점수페이지   
레벨이 늘어날 수록 외울 시간 0.5초씩 추가   

-- 2023.04.08   
background color, button color 결정   
   
-- 2023.04.11 ~ 2023.04.13  
AimTraining View Controller Create   
랜덤으로 버튼 위치 생성   
30번의 테스트동안의 누적 시간 출력   
   
-- 2023.04.14    
Reation Test CFAbsoluteTimeGetCurrent에서 TimeInterval로 변경   
이 방법이 반응속도가 좀더 빠르게 측정됨을 확인   
RESET버튼과 Info&Rank 버튼 제거 (어플의 조잡함)   

-- 2023.04.17 ~ 2023.04.19   
ChimpTest   
40개의 버튼 중 4개의 레벨부터 시작하여 레벨당 갯수를 +1 하며 순서를 기억하여 테스트 진행   
초기화 하는 과정에서 다음 단계로 이동이 초기화보다 빠르게 진행되는 오류   
   
-- 2023.04.20 ~ 2023.04.21   
LottieFiles를 이용해 .json애니메이션 추가   
ViusalMemory, Aim Trainer, Chimp Test / Score ViewController에 차등 점수에 따른 결과 애니메이션 변경   
   
-- 2023.04.24 ~ 2023.04.26   
Sequence Memory Create   
추가되는 랜덤 변수들을 순차적으로 출력해야하는 단계   
현재는 동시에 버튼의 색이 변경됨   
위 문제들 전부 해결   
   
++ 각 테스트들 결과페이지&설명페이지 애니메이션 추가   
   
-- 2023.04.27   
xcode 14.3 update   
Main 화면 애니메이션 추가   
Icon 이미지 임시로 변경   
   
-- 2023.04.28   
DB연결   
참고 사이트   
https://ios-development.tistory.com/86   
https://hururuek-chapchap.tistory.com/39   
https://42kchoi.tistory.com/387   
   
-- 2023.05.02   
RankVC , RankTableVC Create   
-- 2023.05.03   
name TextField 제작   
글자수 제한   
https://velog.io/@sso0022/iOS-TextField-%EA%B8%80%EC%9E%90%EC%88%98-%EC%A0%9C%ED%95%9C%ED%95%98%EA%B8%B0-%ED%95%9C%EA%B8%80   
navigation controller로 show하여 페이지 이동시 데이터 값들 전달   
https://0urtrees.tistory.com/45   
   
-- 2023.05.03 ~ 05.05   
DB 기능 구현 및 점수 기록 VC에서 DB에 insert   
```
CREATE TABLE IF NOT EXISTS test3(
               id INTEGER PRIMARY KEY AUTOINCREMENT,
               name TEXT UNIQUE DEFAULT 'no value',
               reaction INT DEFAULT 9999,
               verbal INT DEFAULT 0,
               visual INT DEFAULT 0,
               number INT DEFAULT 0,
               aim REAL DEFAULT 9999.0,
               chimp INT DEFAULT 0,
               sequence INT DEFAULT 0);
```
위의 구조로 DB table 구성   
   
-- 2023.05.06 ~ 05.10   
한 VC안에 두 tableView를 구성   
두 셀의 identifier을 "cell"로 통일시켜 호출하고,   
각 cell안의 label은 TableViewCell 을 따로 만들어 관리한다.   
각 게임 별로 계정별 첫 게임저장과 그 후 기록갱신에 대한 오류 해결   
첫 화면에서 닉네임 입력시 중복형태의 닉네임 생성 불가
닉네임 입력 키보드 출력시 키보드 크기만큼 화면 올리고 내리기   
SignUp, login, logout 기능 구현   
