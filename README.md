# ABC
Are U Better than Chimpanzee?   
반응 속도 테스트의 ios앱 버전이다.   
   
***   
To Do List   
1. 화면을 너무 빠르게 누르면 초기화시키는 과정을 집어넣었는데   
몇초뒤에 시작시키려는 DispatchQueue함수가 이미 실행된 상태에서 초기화를 시키면 이미 선입력된 DispatchQueue함수가 자동으로 실행되는 오류   
2. 테스트들의 평균 통계적 자료들⚝(일단은 타 테스트 페이지의 통계를 캡쳐하여 진행)   
3. life 들이 전부 숫자로 되어있는데 하트 모양으로 가독성 좋게 바꾸기 (배열을 count해서 경우마다 하트 넣으면 될듯싶다)
4. VisualMemory 게임 버튼 예쁘게, 색이 흰색이나 파란색으로 바뀔때 애니메이션, 누를때마다 소리   
   
~~5. visualMemory 게임에서 타일이 변경되는 와중에 클릭을 하면 색이 안바뀐상태로 게임이 진행되는 문제~~   
6. 흰색으로 실행했을떄 게임 버튼이 흰색으로 바뀌는 경우의 가독성 저하   

***
   
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

   
back button 고치기   
아마 navigationbar의 title을 만지자
