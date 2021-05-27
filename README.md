# semiProjectV1b

회원가입처리

join.jsp -> 회원정보 입력 -> joinok.jsp


로그인처리

login.jsp -> 아이디/비번 입력 ->
loginok.jsp =>아이디/비번 일치 -> myinfo.jsp
            =>아이디/비번 불일치 -> 경고 -> login.jsp


myinfo.jsp
보안설정 - 로그인하지 않은 경우 볼수 없도록

1. 세션객체가 제대로 생성된경우 (로그인 성공시)
로그인한 회원정보(아이디/이름/이메일/가입일)가
myinfo.jsp에 출력되도록 작성

2. 로그인한 경우
상단메뉴의 '로그인'을 '로그아웃'으로 변경함

2b. 로그아웃한 경우
상단메뉴의 '로그아웃'을 '로그인'으로 변경함

로그인/로그아웃 처리

게시판

1. 글쓰기 (write.jsp, writeok.jsp) - 회원만 가능
a. board 테이블에 입력한 글을 저장
b. 작성자는 직접 작성하지 않고 미리 기입되어 있도록 함
   => 로그인시 생성한 세션변수를 이용
   => input태그의 value 속성 활용
c. 입력완료 후 list.jsp로 페이지 이동


2. 목록출력 (list.jsp) - 누구나 가능
a. 글쓰기 버튼 : 회원일때만 버튼이 나타남
b. 테이블 출력
   board 테이블의 글번호,제목,작성자,작성일,추천수,조회수를
   뽑아서 테이블 형태로 출력



3. 본문출력 (view.jsp) - 누구나 가능
a. 조회수 증가
b. 본문글 출력시 list.jsp 에서 bdno 넘김
c. 줄바꿈을 br 태그로 변경
d. 목록으로 버튼 생성 -> 클릭시 list.jsp로 이동
