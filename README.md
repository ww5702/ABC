# ABC
Are U Better than Chimpanzee?   
반응 속도 테스트의 ios앱 버전이다.   
   
-- 2023.03.14   
GameMainViewController Create   
CFAbsoluteTimeGetCurrent()를 통해 절대시간을 정하고 x1000을 해줌으로 ms 구하기 기능 구현   
touchLabel을 만들어 해당 label에 UITapGestureRecognizer()을 통해 label에 터치 이벤트를 구현.   
하지만 변화가 없다는 사실을 발견후 오류 해결   
   
<img width="260" alt="스크린샷 2023-03-14 오후 5 39 24" src="https://user-images.githubusercontent.com/60501045/224943805-63d3bb83-7023-4366-987b-f714f1d8f58d.png">   
   
User Interaction Enabled가 해제되어있어서 그렇다는 사실을 발견   
label이 안눌려있도록 되어있던거라 체크하여 해제   

-- 다음
stack에 label을 2개 집어넣어 몇번째 테스트인지 표시   
만약 일찍 누른다면 오류 발생시키기.   
