# ABC
Are U Better than Chimpanzee?   
반응 속도 테스트의 ios앱 버전이다.   
   
***   
To Do List   
1. 화면을 너무 빠르게 누르면 초기화시키는 과정을 집어넣었는데   
몇초뒤에 시작시키려는 DispatchQueue함수가 이미 실행된 상태에서 초기화를 시키면 이미 선입력된 DispatchQueue함수가 자동으로 실행되는 오류   
2. 게임 전환을 그저 우클릭으로 action segue show로 하였는데 navigation으로 변환시키기   
***
   
-- 2023.03.14   
GameMainViewController Create   
CFAbsoluteTimeGetCurrent()를 통해 절대시간을 정하고 x1000을 해줌으로 ms 구하기 기능 구현   
touchLabel을 만들어 해당 label에 UITapGestureRecognizer()을 통해 label에 터치 이벤트를 구현.   
하지만 변화가 없다는 사실을 발견후 오류 해결   
   
<img width="260" alt="스크린샷 2023-03-14 오후 5 39 24" src="https://user-images.githubusercontent.com/60501045/224943805-63d3bb83-7023-4366-987b-f714f1d8f58d.png">   
   
User Interaction Enabled가 해제되어있어서 그렇다는 사실을 발견   
label이 안눌려있도록 되어있던거라 체크하여 해제   

<img width="455" alt="스크린샷 2023-03-20 오후 5 57 43" src="https://user-images.githubusercontent.com/60501045/226292672-f30611ce-33ab-4806-a9e7-f697d64d45f6.png">   
   
   
<img width="455" alt="스크린샷 2023-03-20 오후 6 02 16" src="https://user-images.githubusercontent.com/60501045/226292839-91cabe5e-78d3-4a32-b343-e811ba9a4dc0.png">   
   
   
<img width="455" alt="스크린샷 2023-03-20 오후 6 01 13" src="https://user-images.githubusercontent.com/60501045/226292713-7a14a2a0-a633-4536-bde8-9999b3f0700b.png">   
   
   

-- 2023.03.15 ~ 2023.03.17   
GaimMainViewController -> ReactionGameViewController 로 변경   
GameSelectViewController Create(메인 화면 입장 시, 여러 게임 종류 선택 화면)   
ReactionGameViewController 여러 경우의수에 따른 함수나 변수 초기화   
TableView를 통해 5번의 기록 저장   
평균 반응속도를 화면에 출력   
   
-- 2023.03.20   
