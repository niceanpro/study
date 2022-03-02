vi 명령어

<subject> <verb> <object>

simple vim grammar
<command> <motion / text object>

motions     move your cursor
			a - all
			i - in
			t - til
			f - find forward
			F - find backward

commands 
	d - delete ( also cut )
	c - change ( delete, then place in insert mode )
	y - yank ( copy )
	v - visually selection


combos
	d$ Delete till the end of the line
	dG Delete till the end of the file
	c^ Change till the beginning of the line
	dj Delete the current line and the one below

<command> <modifier> <motion>
	d3j Delete the current line and 3 lines bellow it
	d4t) Delete till the fourth paraenthesis


verb + noun
verb : d, c, >, v, y
noun : w, b, 2j(down 2 lines)
		iw(inner word), it(inner tag), i"(inner quotes), ip(inner paragraph), as(a sentense)

Text Objects
	iw/aw inner/around word
	is/as inner/around sentence
	ip/ap inner/around paragraph
	it/at inner/around tag
	i"/a" inner/around quoation

* surround ( 서라운딩 )
	cs"' : " -> '
	cs") (() : " -> ()로 바꿈 
	ds" : delete "
	ysiw] ([) : 단어앞뒤로 []를 붙임, [  ]를 붙임(space포함)  iw : text object
	yss) : 라인 전체에 ()를 붙임
	ys(iw, s)<em> : 단어/라인에 <em> tag를 붙임j
	visual mode 에서 selection이후에 S+tag : selection된 부분을 Tag로 감싼다.	

* surround ( 서라운딩 )
	동사는 y : create, c : change, d : delete
	cs"' : " -> '
	cs") : " -> ()로 바꿈 
	ds" : delete "
	ysiw] ([) : 단어앞뒤로 []를 붙임, [  ]를 붙임(space포함)  iw : text object, w : 현제커서부터 단어 끝까지
	ysw] : Hell[o] World!
	3ysw] : 3단어를 []를 붙임
	3yss] : 3라인을 []를 붙임
	yss) : 라인 전체에 ()를 붙임
	ys(iw, s)<em> : 단어/라인에 <em> tag를 붙임j
	visual mode 에서 selection이후에 S+tag : selection된 부분을 Tag로 감싼다.	

	"Hello World!"
	cs"' : 'Hello World!'
	cs'<q> : <q>Hello World!<q>
	cst" : "Hello World!"
	cst<p> : 커서 위에 해당 tag이름의 Pair tag를 'p'로 바꾼다.
	csttp> : 커서 위에 해당 tag이름의 Pair tag를 'p'로 바꾼다.
	ds" : Hello World!
	ysiw] : [Hello] World!
	cs]{ : { Hello } World!
	yssb / yss( : ( {Hello} World! )
	ds{ds( : Hello World!
	ysiw<em> : <em>Hello<em> World!
	visual mode 에서 Selection 후 S<p> : <em>Hello<em> <p>World!<p>



	* Delete surrou­ndings
		ds delete surrou­nding
		ds" delete surrou­nding "
		ds) delete surrou­nding ()
		dst delete surrou­nding (html)tag

	* Change surrou­ndings
		cs"' change surrou­nding " to '
		cs"<­q> change surrou­nding " to <q>­some text­</q>
		cst<p> change surrou­nding tag with <p>
		cs)] change surrou­nding () to []
		cs)[ change surrou­nding () to [] with spaces

	* Create surrou­ndings
		ysiw) add surrou­nding () to inner word
		ysiW) add surrou­nding () to inner connected words in spaces
		yss] add surrou­nding [] to whole line, without leading whitespace
		ysp<p> add surrou­nding <p> to whole paragraph, without leading whitespace

	* Visual mode ( 추가만 가능 )
		S" surround selected text with "
		S<p> surround selected text with <p> ... </p>

	* Targets
		The |ds| and |cs| commands both take a target as their first argument. The
		possible targets are based closely on the |text-objects| provided by Vim.
		All targets are currently just one character.

		(, ), {, }, [, ], <, and >
		The targets b, B, r, and a are aliases for ), }, ], and >
		', ", `,
		A t is a pair of HTML or XML tags.

		The letters w, W, and s correspond to a |word|, a |WORD|, and a |sentence|. A p represents a |paragraph|

	* functions
		ysWfprint<cr>
		wraps old text into a function print
		ysWFprint<cr>
		wraps a WORD into a function print with spaces



* 이동 ( move )
	w : 
	b : 
	e : 
	ge : 


* 검색 ( find ) / 이동 ( move )
	*, # 이후 n/N : 커서가 있는 단어로만 이루어진(같은) 단어 검색 및 이동
	g*, g# : 커서가 있는 단어를 포함한 단어 검색
	f/F{char} => ;(forward) ,(backward) : 글자 검색(앞으로/뒤로) ( including character )	
	t/T + char : till character ( excluding character )
	F7, Shift + F7 : 단어에 커서 놓고 f7 : 커서 있는 다음 단어 찾아 감
	([a-z]).\1   ata ehe tot 등을 찾음 ()와 같은\1을 찾음
	([a-z]{3})(\d{2})\1\2  abc55abc55 는 찾지만 abc55abc56은 못 찾는다.



  -- eclipse
	검색 모드창에 글자 paste하기 : ctrl + c -> '/' -> ctrl + r -> register(shit + '+')
	ctrl + J : incremental find
	* ctrl + shift + L : Quick Test Search
	* ctrl + shift + H : Open Type in Hierarchy
	* ctrl + shift + R : Open Resource
	* ctrl + shift + B : Break Toggle
	* ctrl + shift + 6 : Previous Window Toggle
	alt + Left, Right : Previous/Forward Window
	* ctrl + shift + - : 창분할/병합 상하
	* ctrl + shift + { : 창분할/병합 좌우
  
  -- vsvim
	* ctrl + - : font 축소
	* ctrl + + : font 확대
	검색 Search : visual로 설정 -> ctrl + c -> '/' -> ctrl + v




* 편집 ( edit )
	( 동사 +  대상 [현재부터 명령어 까지] ) 
			: ( object( from : 생략 시 현재 라인 부터 ( from, to | % ) ) )  ( 조건 : g(!) v /pattern ) 
				+ (adverbs) verb ( d s y v = )
				+ (adjectives) target ( from ) / ( g i I c n )
	d'a : 현재위치부터 'a까지 삭제
	df'글자' : 현재커서위치부터 글자까지 삭제
	yw : 한단어 복사  레지스터 0에 저장 되어 있다. 값을 부를 때는 ctrl + r , 0    커서에 있는 단어 부를 때는 ctrl + r , ctrl + w
	cl : 한문자 지우고 insert mode
	cw : 현재 글자부터 단어 끝까지 지우고 insert mode
	ci' : ''안의 문자열을 지우고 insert mode
	ca' : ""을 포함한 문자열을 지우고 insert mode
	d} : 현재부터 단락의 끝까지 삭제
	3jl : 3문자만 복사
	d/foo : 현재부터 foo로 시작하는 문자를 찾기 전 까지 삭제
	d/foo/b1 : 현재부터 foo로 시작하는 문자를 찾기 전 까지 + 1자 추가 삭제
	ye : 현재부터 단어의 끝까지 yank해서
	"by/foo : Object("b) + verb(y) + target(/foo)    커서에서부터 foo까지를 register b에 yank
	p : Object(익명) + verb(p)
	"bp : Object(b) + verb(p)
	3J : 다음 3줄을 합침 ( 줄간에 space있음 )
	gJ : 다음줄을 함칩 ( 줄간에 space없음 )
	d5 : 현재 줄에서 밑으로 5번째 단락의 끝까지 삭제
	:.,$j : 현재 줄부터 마지막 줄까지 모두 한 줄로 합친다 
	:% : (모든 줄) :1,$와 같다 
	:... g : 패턴에 매칭되는 모든 줄(globally) 
	:... v : 패턴에 일치하지 않는 모든 줄(conVerse(반대))  
	:.,+21g/foo/d : 현재 줄부터 다음 21줄에 걸쳐 “foo”를 포함하는 모든 줄을 지우는 것 ( 중간에 띄어쓰기 하면 안된다. )
	:.,$v/bar/d : 현재 줄부터 파일의 끝까지 “bar”를 포함하지 않는 모든 줄을 지우는 것 
	:% g/foo/s/bar/zzz/g : “foo”를 포함하는 모든 줄에서 모든 “bar”를 “zzz”로 대치 
	:g/<pattern>/[d|s|normal] normal to perform (basic) normal-mode commands on those lines 
	:g!/<pattern>/[d|s|normal]   이것은 아래줄과 같다.
	:v/<pattern>/[d|s|normal] 
	:s/foo/\=@x/(i,I,g,c,n) 현재줄의 foo를 레지스터x의 값으로 대체
	:%s/\<foo\>/bar/gc   Change only whole words exactly matching 'foo' to 'bar'; ask for confirmation.  
	:g/^baz/s/foo/bar/g	Change each 'foo' to 'bar' in each line starting with 'baz'.  
 
	d/fred/                                :delete until fred 라인 전까지
	d/fred                                 :delete until fred 문자 전까지
	y/fred/                                :yank until fred

	:g/joe/,/fred/d             : not line based (very powerfull)   joe 있는 곳 부터 fred 있는 곳 까지 지움


	123 def ghi
	432 ius dkf
	089 cdo lks

	이걸 숫자를 가운데로, 두번째는 끝, 세번째 처음으로 보내려면

	:%s/([0-9]*) ([a-z]*) ([a-z]*)/3 2 1/g


	Ctrl + o : 편집모드에서 잠시 normal mode로 이동하게 도와 준다.

	gi : 마지막 편집하던 곳으로 이동해서 편집할 수 있음

	다중 단어 커서 : ctrl + shift + l 
	다중 커서 : ctrl + alt + {up, down}
	위/아래복사 : alt+shift+{up,down}
	위/아래이동 : alt+{up,down}
	동일 단어 선택 및 편집 : ctrl + F2

	u : undo
	U : 마지막 작업한 줄만 undo
	ctrl+R : redo     in vscode에서 ctrl + shift + z
	undo 				in vscode에서 ctrl + z

	
	

	다중라인 동시 편집
	ctrl + v => (커서를 이동해서 원하는 만큼 선택) => shift +i
	


	-- 정렬 ( sort )
	블럭 잡고 '='
	better aling ( ctrl + alt + = ) : =, :, +=, -=, *=, /=, =>를 기준으로 정렬 한다.

	gg = G (전체 정렬)
	:sort(%! sort)    sort all lines of file
	:3, 8! sort


	

	g~ : Swap case
	gu : Make lowercase
	gU : Make uppercase
	gUaw : 현재 단어를 대문자로
	gue : 커서부터 단어 끝까지 소문자로
	u : 소문자로 변경
	U : 대문자로 변경

	-- vs code에서
	gc10c : 10줄 주석 토글
	visual mode로 선택해 놓고 gc : 영역만큼 주석  처리 ( 주석 해지 )

	-- 입력모드에서
	<Ctrl-o>	Switch to Insert Normal mode(입력모드에서 명령어모드 하나만 실행하고 다시 입력모드로 복귀.)
	<Ctrl-o>zz : 입력 중인 행이 창의 상단 또는 하단에 있을 때 추가 맥락을 보기위해 화면을 스크롤하고 싶을 때

' dlrjtdms '


* 이동  ( move )
	% : 짝을 이루는 기호로 이동
	0 : 줄의 첫칸으로 이동
	^ : 줄의 첫 글자로 이동
	- : 이전줄의 첫 글자로 이동
	+ : 다음줄의 첫 글자로 이동
	gg : 첫줄의 첫 글자로 이동
	G : 파일의 끝 줄로 이동
	H,M,L : 화면 처음,중간,마지막으로 커서 이동
	'' : 커서가 이동 하기 전의 위치로 이동 ( 마지막 위치 )
	'. : 마지막 수정 한 곳 으로 이동
	숫자 + j/k : 숫자 만큼 위 아래로 이동      11/22/33 + j/k
	숫자 + j/k : 숫자 만큼 위 아래로 이동      11/22/33 + j/k
	숫자 + % : 문서의 %위치의 위 아래로 이동 
	'` : 마지막 점프한 곳으로 이동
	'. : 마지막 수정한 곳으로 이동
	'^ : 마지막 입력한 곳으로 이동
	ctrl + o : jump to older position (매우중요)
	ctrl + i : jump back to newer position (매우중요)
	) : 다음 문장
	( : 이전 문장
	} : 다음 단락
	{ : 이전 단락
	]] : 다음 섹션
	[[ : 이전 섹션
	'[	: First character of previously changed text
	']	: Last character of previously changed text
	'<	: First character of previous visual mode selection
	'>	: Last character of previous visual mode selection
	gD(ctrl + ] , gd) : jump declaration
	ctrl+shift+o : 파일내의 기호로 이동
	dt' : '앞까지 삭제
	yt' : '앞까지 복사
	vt' : '앞까지 선택

	df' : '까지 삭제
	yf' : '까지 복사
	vf' : '까지 선택




* 마크 이동
	m[A~Z] : mark up global(다른 파일도 적용)
	'[A~Z] : 이동
	:marks : mark list보여줌
	:delmarks[!][marks]



* 화면 이동
	zt : 커서가 있는 라인을 제일 위로 
	zz : 커서가 있는 라인을 화면 가운데로 
	zb : 커서가 있는 라인을 제일 아래로 
	z.(zz)  : 커서를 화면의 중앙에 위치
	z-  : 커서를 이동해 화면의 아래에 위치
	ctrl-e  : 커서를 그자리에 둔채 화면을 한줄 아래로 이동
	ctrl-y  : 커서를 그자리에 둔채 화면을 한줄 위로 이동
	ctrl + w : 화면간 이동
	ctrl + tab : 같은 화면의 tab간 이동


* 화면 크기
	ctrl + w, = : 화면 크기동일하게 조정
	ctrl + w, < : 화면 화면은 한단위 작게 조절
	ctrl + w, > : 화면 화면을 한단위 크게 조절


	* ctrl + W : 창닫기
	ctrl + F4 : 창닫기



* 파일
  -- eclipse
	:files(or ctrl + F6) : scroll로 열려 있는 file중에 이동

	:ls : buffer의 목록을보여준다.
	:b [n] : n번째 file이동


	F3 : 선언된 변수로 이동, 메소드 정의부로 이동
	F4 : Class Hierarchy를 볼 수 있음
	ctrl + T : class 종속관계 (super type hierachy)
	ctrl + O : 해당 class의 메소드나 필드 이동하기 (inherited member)
	ctrl + shift + T : open Type
	ctrl + Alt + H : call 함수 모두 찾기
	ctrl + shift + G : Find References in Workspace



* 블럭 
  - gv : 블럭재지정
  - 블럭지정후 ':'를 누르면 '<, '>로 범위를 지정한것이 나옴
	vw : 
	:norm i# : 블럭 지정 후 ':' -> norm 이후 문자대로 수행 여기서는 insert'#'
	:norm 1x : 블럭 지정 후 ':' -> norm 이후 문자대로 수행 여기서는 한글자 지우기

	alt + shift + {right, left}  :  {}, (), [] 블럭단위  블럭 지정



* 매크로 ( macro )
  - 매크로 시작 q[a-z] 입력 q(끝날때)
	매크로 추가 q[A-Z] 입력 q
	매크로 실행 @[a-z]
	매크로 보기 : reg [a-z]
	매크로에서 visual mode 범위 적용하기 : normal @a
	:put a : 매크로 a의 내용을 출력


* 숫자의 증감 ctrl+a ctrl+x
	add
	extract
	-사용법
	101ctrl+a
	100ctrl+x



* set syn=c
	확장자가 다른 파일 강제 syntax할당
	확장자가 틀려서 syntax 칼라매핑이 안될 때.
	ctrl+k ctrl+m : language형식 선택
	


* 폴더 ( folding )
	zo : 폴더 펴기
	zc : 폴더 접기
	zR : 모든 폴더 펴기
	zM : 모든 폴더 접기
	ctrl + m : 폴더 접기 & 펴기
	zf : visual mode에서 선택한 영역만큼 폴딩



* 주석 ( comment )
ctrl + shift + / : 블럭주석 추가
ctrl + shift + \ : 블럭주석 제거
	:norm i# 
	:norm 1x : 
	ctrl + v -> shift + i -> //

	visual mode선택 후  :  ctrl + / 혹은 :gc =>  // 이 토글 됨





* 화면 분할 ( split )
	:sp {file name} : 상하 분할	
	:vsp {file name} : 좌우 분할	


{anpro}h'ah'ah
{anpro}hahah



* Register
	"a-"z	Named registers
	"0-"9	Yank/Delete registers
		"0  yank text   1-9 deleted text
	""	Unnamed register ( last delete or yank )
	"+  Clipboard register on OS  :  gg"+yG copy entire file contents to clipboard
	"*	Clipboard register on Window ( visually selected text )
	"-	Last Small Delete register
	".	Last Insert register
	"/	Last Search register
	"_	Blackhole ( /dev/null ) register
	":	Last Command line register
	"=  Last Expression register
	"%  Last Open file name register
	"#  alternate file name
	:reg 레지터스터의 내용물 표시
	"xy visual mode에서 선택 후 레지스터 x로 복사
	"xp 레지스터 x의 내용물 붙여넣기   예: "0p  0번 레지스터 내용 붙여넣기(명령어 모드)
	"Xy 레지스터 x에 편집기내용 yank해서 추가(대문자)하기
	"Xd 레지스터 x에 편집기내용 delete해서 추가하기
	:s/foo/\=@x/(i,I,g,c,n) (visual studio에서 가능)
	:s/foo/ctrl+r+{레지스터변수}/(i,I,g,c,n) (vusual code에서 가능 ) ctrl+r, 레이지스터 변수 를 누르면 레지스터 값이 나옴
	:put a : 레제스터 a의 내용을 출력 -> 레지스터 변경 후 "add 로 다시 저장

	:g/fred/y A | :let @*=@a    : put into paste buffer
	:let @a=''|g/Barratt/y A |:let @*=@a
	:reg 	레지스터 내용 보기



** Eclipse에서만...
	* ctrl + M : 전체 화면 토글
	* ctrl + shift + O : 자동 import
	* ctrl + , or . : (에러, 워닝, 북마크)로 점프
	* Ctrl + Shift + F4 : 열린 파일 모두 닫기



** 함수 및 키보드 매핑하기
	"============== 주석 매크로 ==============
	func! CmtOn()    "주석 on
	exe "'<,'>norm i//"
	endfunc

	func! CmtOff()    "주석 off
	exe "'<,'>norm 2x"
	endfunc


	vmap <c-c> <esc>:call CmtOn() <cr>
	vmap <c-x> <esc>:call CmtOff() <cr>
	nmap <c-c> <esc>v:call CmtOn() <cr>
	nmap <c-x> <esc>v:call CmtOff() <cr>


	이렇게 작성했으면 저장하고 나옵니다.

	컨트롤+C : 주석 달기
	컨트롤+X : 주석 지우기



* Sneak기능
	s/S{char}{char} : f와 같으나 여러행에 걸처 두 글자로 찾는다. ;(forward) ,(backward) sneak기능
	opeator + z/Z + {char}{char} : char,char까지 operator을 수행한다.



* Easy Motion ( leader = \ )
	<leader><leader> + (j,k, w,b, l,h, e) : 라인,단어, 단어앞뒤, 단어끝을 빨리 이동할 수 있도록 한다.
	<leader><leader> + (f,s) + (char) : 특정 글자를 찾는다.



* Easy Motion (hklyuiopnm,qwertzxcvbasdgjf;)   visual code : leader = <space>
	Default Mapping      | Details
	---------------------|----------------------------------------------
	<Leader>f{char}      | Find {char} to the right. See |f|.
	<Leader>F{char}      | Find {char} to the left. See |F|.
	<Leader>t{char}      | Till before the {char} to the right. See |t|.
	<Leader>T{char}      | Till after the {char} to the left. See |T|.
	<Leader>w            | Beginning of word forward. See |w|.
	<Leader>W            | Beginning of WORD forward. See |W|.
	<Leader>b            | Beginning of word backward. See |b|.
	<Leader>B            | Beginning of WORD backward. See |B|.
	<Leader>e            | End of word forward. See |e|.
	<Leader>E            | End of WORD forward. See |E|.
	<Leader>ge           | End of word backward. See |ge|.
	<Leader>gE           | End of WORD backward. See |gE|.
	<Leader>j            | Line downward. See |j|.
	<Leader>k            | Line upward. See |k|.
	<Leader>n            | Jump to latest "/" or "?" forward. See |n|.
	<Leader>N            | Jump to latest "/" or "?" backward. See |N|.
	<Leader>s            | Find(Search) {char} forward and backward.
						 | See |f| and |F|.
	<leader><leader> / <char>... <CR>	Search n-character
	<leader><leader><leader> bdt	Til character
	<leader><leader><leader> bdw	Start of word
	<leader><leader><leader> bde	End of word
	<leader><leader><leader> bdjk	Start of line
	<leader><leader><leader> j	JumpToAnywhere motion; default behavior matches beginning & ending of word, camelCase, after _ and after #



* pEasyMotion ( visual studio 2019 )  leader = shift + space
	<leader> + s : 단어 이동
	<leader> + l : 라인 이동
	<leader> + d : 열려있는 Tab에 있는 문서간 이동	

    vim에서 사용하는 key
       hklyuiopnm,qwertzxcvbasdgjf;


* Tab 
  - ctrl + tab ( tabs ) : 탭 목록 보기
  - :tabn [n]  ( gt ) : n번 만큼 다음으로 이동
  - :tabp [n]  ( gT > ) : n번 만큼 이전으로 이동
  - :tabdo %s/old/new/g : 모든tab에 문자 교체
  - :tabclose : 탭을 닫기
  - :tab1 b.txt : b.txt가 존재하면 열고 없으면 error
  - :tabnew b.txt : 새로운 탭에 b.txt가 존재하면 열고 없으면 new
	ctrl + n : 새창


** 다중 창 ( window )
	명령모드 

	ctrl + tab : 같은 화면의 tab간 이동

	ex모드 결과 창생성

	CTRL-W s ( :new ) :[N]sp[plit] 현재 파일을 두 개의 수평 창으로 나눔
	CTRL-W v ( :vs ) :[N]vs[plit] 현재 파일을 두 개의 수직 창으로 나눔   == ctrl + \

			--		CTRL-W n :new 새로운 수평 창 생성
			--		CTRL-W ^ 또는 CTRL-W CTRL-^ 수평 창으로 나누고 이전 파일의 오픈
			--		CTRL-W f 창을 수평으로 나누고 커서 위치의 파일 오픈
			--		CTRL-W i 커서 위치의 단어가 정의된 파일을 오픈

	

	창삭제
	CTRL-W q :q[uit]! 현재 커서의 창을 종료

	CTRL-W c :close 현재 커서의 창 닫기
	CTRL-W o :on[ly] 현재 커서의 창만 남기고 모든 창 삭제

	

	창이동 
	ctrl + 1,2,3,4 : 원하는 화면 위치로 이동
		{ "key": "ctrl+1","command": "workbench.action.openEditorAtIndex1" },
		{ "key": "ctrl+2","command": "workbench.action.openEditorAtIndex2" },
	CTRL-w h 왼쪽 창으로 커서 이동 
	CTRL-w j 아래쪽 창으로 커서 이동
	CTRL-w k 위쪽 창으로 커서 이동
	CTRL-w l 오른쪽 창으로 커서 이동
	CTRL-w w 창을 순차적으로 이동

	CTRL-w p 가장 최근에 이동한 방향으로 이동
	CTRL-w t 최상위 창으로 이동
	CTRL-w b 최하위 창으로 이동

	

	창이동

	CTRL-w r 순차적으로 창의 위치를 순환
	CTRL-w x 이전 창과 위치를 바꿈
	CTRL-w H 현재창을 왼쪽 큰화면으로 이동
	CTRL-w J 현재창을 아래쪽 큰화면으로 이동
	CTRL-w K 현재창을 위쪽 큰화면으로 이동
	CTRL-w L 현재창을 오른쪽 큰화면으로 이동

	CTRL-w (CTRL-)w  순차적으로 창의 위치를 순환	

	

	창 크기 조정

	CTRL-w = 창의 크기를 모두 균등하게 함
		--	CTRL-W _
		--	수평 분할에서 창의 크기를 최대화
		--	CTRL-W |
		--	수직 분할에서 창의 크기를 최대화
	

	CTRL-w [N]+ :res[ize] +N 창의 크기를 N행 만큼 증가    in vscode 프로그램의 폰트 크기늘림
	CTRL-w [N]- :res[ize] -N 창의 크기를 N행 만큼 감소	in vscode 프로그램의 폰트 크기줄임


	CTRL-w [N]> 창의 크기를 오른쪽으로 N칸 만큼 증가
	CTRL-w [N]< 창의 크기를 오른쪽으로 N칸 만큼 감소


	다중창 사용의 경우 대부분 붙여서 사용하는 명령어는 CTRL을 같이 눌러도 똑같은 역활을 하는 경우가 많다.
	예) CTRL-W j 는 CTRL-W CTRL-J와 같다.


** Book mark
	Ctrl + Alt + K : 북마크 추가/삭제
	command 검색모드 ( ctrl + shift + p )에서 book mark from all files에서 찾는다.
	




* 정규표현식
	- 특정한 패턴을 기술하기 위한 Meta 언어를 이용하는 패턴 묘사.

	^ 행의 시작에서 정규 표현식의 첫번째 문자가 매치(대괄호 안에서는 부정의 의미)
	. 개행문자를 제외한 임의의 문자 한 개와 매치
	[] 대괄호 안에 있는 임의의 문자와 매치하는 문자 클래스, 범위 [a-c] -> a, b, c   [^a] -> a를 제외한 문자
	* 바로앞에 있는 패턴이 0번 혹은 그 아상 반복되는 것
	$ 행의 끝에서 정규표현식의 마지막 문자가 매치
	\+ 앞에 있는 정규 표현식이 한 번이나 그 이상 반복하여 매치할 수 있음을 의미.
	A\{1,3\} ;문자 A가 한번에서 연속 세번까지 나타난 문자열 매치
	\| 앞에 있는 정규 표현식 혹은 뒤에 있는 정규 표현식에 매치
	\< 단어의 시작
	\> 단어의 끝
	\( \) 정규표현식 여러 개를 새로운 정규표현식 한 개로 묶는다.
	\s 공백(탭, 스페이스)
	\d 숫자




	:range g[lobal][!]/pattern/cmd
	Execute the Ex command cmd (default ":p") on the lines within [range] where pattern matches. If pattern is preceded with a ! - only where match does not occur.
	Vim command line like :s[ubstitute], :co[py] , :d[elete], :w[rite] 


	Syntax of the text substitution
	:[range]s[ubstitute]/{pattern}/{string}/[flags] [count]


	When searching:

	., *, \, [, ^, and $ are metacharacters.
	+, ?, |, &, {, (, and ) must be escaped to use their special function.
	\/ is / (use backslash + forward slash to search for forward slash)
	\t is tab, \s is whitespace (space or tab)
	\n is newline, \r is CR (carriage return = Ctrl-M = ^M)
	After an opening [, everything until the next closing ] specifies a /collection. Character ranges can be represented with a -; for example a letter a, b, c, or the number 1 can be matched with [1a-c]. Negate the collection with [^ instead of [; for example [^1a-c] matches any character except a, b, c, or 1.
	\{#\} is used for repetition. /foo.\{2\} will match foo and the two following characters. The \ is not required on the closing } so /foo.\{2} will do the same thing.
	\(foo\) makes a backreference to foo. Parenthesis without escapes are literally matched. Here the \ is required for the closing \).
	
	
	When replacing:

	\r   is newline, \n is a null byte (0x00).
	\&   is ampersand (& is the text that matches the search pattern).
	\0   inserts the text matched by the entire pattern
	\1   inserts the text of the first backreference. \2 inserts the second backreference, and so on.

	You can use other delimiters with substitute:

	:s#http://www.example.com/index.html#http://example.com/#
	Save typing by using \zs and \ze to set the start and end of a pattern. For example, instead of:

	:s/Copyright 2007 All Rights Reserved/Copyright 2008 All Rights Reserved/
	Use:

	Using count in substitution, If you specify the count N in the substitution then it means do substitution in N lines from the current position of the cursor. do substitution in 4 lines from the current line.
	:s/helo/hello/g 4
	:s/Copyright \zs2007\ze All Rights Reserved/2008/
	:%s/\<\(hey\|hi\)\>/hai/g
	:%s/^/\=line(".") . ". "/g



	vscode에서 
	:%s/(hey|hi)/hai/g
	neoVim에서
	:%s/\(hey\|hi\)/hai/g

	some test text
	:%s/te(.)/$1/g
	some s x

	\v를 붙이면 '\'를 이후에 안 붙인다.
	vscode에서 enableNeovim : true하면 
	\< \>, 
	g, v
	line()
	submatch()
	expand()
	toupper()
	잘 된다.




	Original Text: Current file path is ~/test/
	:%s/\~/\= expand($HOME)/g
	Translated Text: Current file path is /home/ramesh/test/


	Article 1: Vi and Vim Editor: 3 Steps To Enable Thesaurus Option
	Article 2: Vim Autocommand: 3 Steps to Add Custom Header To Your File
	Article 3: 5 Awesome Examples For Automatic Word Completion Using Ctrl-X
	Article 4: Vi and Vim Macro Tutorial: How To Record and Play
	Article 5: Tutorial: Make Vim as Your C/C++ IDE Using c.vim Plugin
	Article 6: How To Add Bookmarks Inside Vim Editor

	:4,$s/\d\+/\=submatch(0) + 1/
	:s/\d\+/\=submatch(0) + 1/g 3  3라인에 있다면 그곳에서부터 3개 라인만 숫자를 바꿔 준다.
		Range: 4,$ – 4th line to last line.
		Pattern to Search – \d\+ – digits sequence
		Pattern to Replace – \=submatch(0) + 1 – gets the matched pattern and adds 1 to it.
		Flag – as there is no flag, by default it substitutes only the first occurrence.


	Lot of vi/vim tips and tricks are available at thegeekstuff.com. reading
	these articles will make you very productive. following activities can be
	done very easily using vim editor.
			a. source code walk through,
			b. record and play command executions,
			c. making the vim editor as ide for several languages,
			d. and several other @ vi/vim tips & tricks.

	:%s/\.\s*\w/\=toupper(submatch(0))/g

	Lot of vi/vim tips and tricks are available at thegeekstuff.com. Reading
	these articles will make you very productive. Following activities can be
	done very easily using vim editor.
			a. Source code walk through,
			b. Record and play command executions,
			c. Making the vim editor as ide for several languages,
			d. And several other @ vi/vim tips & tricks.


	search일떄는 \가 필요 없는데 substitute일때는 특수 문자에 \가 필요함
	able  abc
	:%s/ab\(le\|c\)/TT/g     T TT
	:%s/ab\(le\|c\)/TT\0/g   Table TTabc 
	:%s/ab\(le\|c\)/TT\1/g   Tle TTc 


	/\cthis matches 'this', 'This', 'thiS', etc
	/\Cthis match exactly 'this', not 'This', 'thiS', etc
	:% s/\v(\a+)/\u\1/g will Capitalize all the words in current file (i.e only first character of word is capitalized)
	:% s/\v(\a+)/\U\1/g will change to all letters to UPPERCASE in current file
	:% s/\v(\w)_(\a+)/\1\u\2/g change variable_name to camelCase
		for ex: 'min_max' will change to 'minMax', 'array_sum' will change to 'arraySum' and so on



	Using the current word or registersEdit

	:%s//bar/g              Replace each match of the last search pattern with 'bar'.
							For example, you might first place the cursor on the word foo then press * to search for that word.
							The above substitute would then change all words exactly matching 'foo' to 'bar'.
	:%s/foo/<c-r><c-w>/g    Replace each occurrence of 'foo' with the word under the cursor.
							<c-r><c-w> means that you press Ctrl-R then Ctrl-W.
							The word under the cursor will be inserted as though you typed it.
	:%s/foo/<c-r><c-a>/g    Replace each occurrence of 'foo' with the WORD under the cursor (delimited by whitespace).
							<c-r><c-a> means that you press Ctrl-R then Ctrl-A.
							The WORD under the cursor will be inserted as though you typed it.
	:%s/foo/<c-r>a/g        Replace each occurrence of 'foo' with the contents of register 'a'.
							<c-r>a means that you press Ctrl-R then a.
							The contents of register 'a' will be inserted as though you typed it.
	:%s/foo/<c-r>0/g        Same as above, using register 0 which contains the text from the most recent yank command.
							Examples of yank (copy) commands are yi( which copies the text inside parentheses around the cursor
							, and y$ which copies the text from the cursor to the end of the line.
							After a yank command which did not specify a destination register, the copied text can be entered by pressing Ctrl-R then 0.
	:%s/foo/\=@a/g          Replace each occurrence of 'foo' with the contents of register 'a'.
							\=@a is a reference to register 'a'.
							The contents of register 'a' is not shown in the command. This is useful if the register contains many lines of text.
	:%s//<c-r>//g           Replace each match of the last search pattern with the / register (the last search pattern).
							After pressing Ctrl-R then / to insert the last search pattern (and before pressing Enter to perform the command)
							, you could edit the text to make any required change.
	:%s/<c-r>*/bar/g        Replace all occurrences of the text in the system clipboard (in the * register) with 'bar' (see next example if multiline).
							On some systems, selecting text (in Vim or another application) is all that is required to place that text in the * register.
	:%s/<c-r>a/bar/g        Replace all occurrences of the text in register 'a' with 'bar'.
							<c-r>a means that you press Ctrl-R then a. The contents of register 'a' will be inserted as though you typed it.
							Any newlines in register 'a' are inserted as ^M and are not found.
							The search works if each ^M is manually replaced with '\n' (two characters: backslash, 'n').
							This replacement can be performed while you type the command:
	:%s/<c-r>=substitute(@a,"\n",'\\n','g')<CR>/bar/g
							The "\n" (double quotes) represents the single character newline; the '\\n' (single quotes) represents two backslashes followed by 'n'.
							The substitute() function is evaluated by the <c-r>= (Ctrl-R =) expression register;
							it replaces each newline with a single backslash followed by 'n'.
							The <CR> indicates that you press Enter to finish the = expression.
	:%s/<c-r>0/bar/g        Same as above, using register 0 which contains the text from the most recent yank command.


	:%s/foo/bar/            On each line, replace the first occurrence of "foo" with "bar".
	:%s/.*\zsfoo/bar/       On each line, replace the last occurrence of "foo" with "bar".
	:%s/\<foo\>//g          On each line, delete all occurrences of the whole word "foo".
	:%s/\<foo\>.*//         On each line, delete the whole word "foo" and all following text (to end of line).
	:%s/\<foo\>.\{5}//      On each line, delete the first occurrence of the whole word "foo" and the following five characters.
	:%s/\<foo\>\zs.*//      On each line, delete all text following the whole word "foo" (to end of line).
	:%s/.*\<foo\>//         On each line, delete the whole word "foo" and all preceding text (from beginning of line).
	:%s/.*\ze\<foo\>//      On each line, delete all the text preceding the whole word "foo" (from beginning of line).
	:%s/.*\(\<foo\>\).*/\1/ On each line, delete all the text preceding and following the whole word "foo".
	:%s/\<foo\(bar\)\@!/toto/g On each line, replace each occurrence of "foo" (which starts a word and is not followed by "bar") by "toto".
	:s/^\(\w\)/\u\1/        If the first character at the beginning of the current line only is lowercase
							, switch it to uppercase using \u (see switching case of characters).
	:%s/\(.*\n\)\{5\}/&\r/  Insert a blank line every 5 lines.
							The pattern searches for \(.*\n\) (any line including its line ending) repeated five times (\{5\}).
							The replacement is & (the text that was found), followed by \r (newline).
	:%s/\<foo\(\a*\)\>/\=len(add(list, submatch(1)))?submatch(0):submatch(0)/g
							Get a list of search results. (the list must exist)
							Sets the modified flag, because of the replacement, but the content is unchanged.
							Note: With a recent enough Vim (version 7.3.627 or higher), you can simplify this to:
	:%s/\<foo\(\a*\)\>/\=add(list, submatch(1))/gn
							This has the advantage, that the buffer won't be marked modified and no extra undo state is created.
							The expression in the replacement part is executed in the sandbox and not allowed to modify the buffer.

"Escaped" characters or metacharacters
	** vscode에서 작동하는 것 **
	#     Matching
	#     Matching
	.     any character except new line	 	 
	\s    whitespace character	
	\S    non-whitespace character
	\d    digit	
	\D    non-digit
	\w    word character	
	\W    non-word character

	** vscode에서 작동안하는 것 : 아래의 것은 검색에서는 안되어도 substitute에서는 잘 된다. **
	\x    hex digit	
	\X    non-hex digit
	\o    octal digit	
	\O    non-octal digit
	\h    head of word character (a,b,c...z,A,B,C...Z and _)	
	\H    non-head of word character
	\p    printable character	
	\P    like \p, but excluding digits
	\a    alphabetic character	
	\A    non-alphabetic character
	\l    lowercase character	
	\L    non-lowercase character
	\u    uppercase character	
	\U    non-uppercase character



Quantifiers, Greedy and Non-Greedy
	*       matches 0 or more of the preceding characters, ranges or metacharacters .* matches everything including empty line
	\+      matches 1 or more of the preceding characters...
	\=      matches 0 or 1 more of the preceding characters...
	\{n,m}  matches from n to m of the preceding characters...
	\{n}    matches exactly n times of the preceding characters...
	\{,m}   matches at most m (from 0 to m) of the preceding characters...
	\{n,}   matches at least n of of the preceding characters...
			where n and m are positive integers (>0)
	\{-}    matches 0 or more of the preceding atom, as few as possible
	\{-n,m} matches 1 or more of the preceding characters...
	\{-n,}  matches at lease or more of the preceding characters...
	\{-,m}  matches 1 or more of the preceding characters...
			where n and m are positive integers (>0)


	Grouping and Backreferences
	&    the whole matched pattern                         \L  the following characters are made lowercase
	\0   the whole matched pattern                         \U  the following characters are made uppercase
	\1   the matched pattern in the first pair of \(\)     \E  end of \U and \L
	\2   the matched pattern in the second pair of \(\)    \e  end of \U and \L
	...  ...                                               \r  split line in two at this point
	\9   the matched pattern in the ninth pair of \(\)     \l  next character made lowercase
	~    the previous substitute string	                   \u  next character made uppercase
	Now the full S&R to correct non-capital words at the beginning of the sentences looks like

	s:\([.!?]\)\s\+\([a-z]\):\1  \u\2:g



Alternations
	"\|"
	\(Date:\|Subject:\|From:\)\(\s.*\)


Regexp Operator Precedence
	1       \( \)                grouping
	2       \=,\+,*,\{n} etc.    quantifiers
	3       abc\t\.\w            sequence of characters/ metacharacters,
								not containing quantifiers or grouping
								operators
	4       \|                   alternation










	
------------------------------------------------------------------------------
" new items marked [N] , corrected items marked [C]
" *best-searching*
	/joe/e                      : cursor set to End of match
	3/joe/e+1                   : find 3rd joe cursor set to End of match plus 1 [C]
/joe/s-2                    : cursor set to Start of match minus 2
	/joe/+3                     : find joe move cursor 3 lines down
	/^joe.*fred.*bill/          : find joe AND fred AND Bill (Joe at start of line)
	/^[A-J]/                    : search for lines beginning with one or more A-J
	/begin\_.*end               : search over possible multiple lines
	/fred\_s*joe/               : any whitespace including newline [C]
	/fred\|joe                  : Search for FRED OR JOE
	/.*fred\&.*joe              : Search for FRED AND JOE in any ORDER!
	/\<fred\>/                  : search for fred but not alfred or frederick [C]
	/\<\d\d\d\d\>               : Search for exactly 4 digit numbers
	/\D\d\d\d\d\D               : Search for exactly 4 digit numbers
	/\<\d\{4}\>                 : same thing
	/\([^0-9]\|^\)%.*%          : Search for absence of a digit or beginning of line
" finding empty lines
	/^\n\{3}                    : find 3 empty lines
	/^str.*\nstr                : find 2 successive lines starting with str
	/\(^str.*\n\)\{2}           : find 2 successive lines starting with str
" using rexexp memory in a search find fred.*joe.*joe.*fred *C*
	/\(fred\).*\(joe\).*\2.*\1
" Repeating the Regexp (rather than what the Regexp finds)
	/^\([^,]*,\)\{8}
" visual searching
	:vmap // y/<C-R>"<CR>       : search for visually highlighted text
	:vmap <silent> //    y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR> : with spec chars
" \zs and \ze regex delimiters :h /\zs
	/<\zs[^>]*\ze>              : search for tag contents, ignoring chevrons
" zero-width :h /\@=
	/<\@<=[^>]*>\@=             : search for tag contents, ignoring chevrons
	/<\@<=\_[^>]*>\@=           : search for tags across possible multiple lines
" searching over multiple lines \_ means including newline
	/<!--\_p\{-}-->                   : search for multiple line comments
	/fred\_s*joe/                     : any whitespace including newline *C*
	/bugs\(\_.\)*bunny                : bugs followed by bunny anywhere in file
	:h \_                             : help
" search for declaration of subroutine/function under cursor
	:nmap gx yiw/^\(sub\<bar>function\)\s\+<C-R>"<CR>
" multiple file search
	:bufdo /searchstr/                : use :rewind to recommence search
" multiple file search better but cheating
	:bufdo %s/searchstr/&/gic   : say n and then a to stop
" How to search for a URL without backslashing
	?http://www.vim.org/        : (first) search BACKWARDS!!! clever huh!
" Specify what you are NOT searching for (vowels)
	/\c\v([^aeiou]&\a){4}       : search for 4 consecutive consonants
	/\%>20l\%<30lgoat           : Search for goat between lines 20 and 30 [N]
	/^.\{-}home.\{-}\zshome/e   : match only the 2nd occurence in a line of "home" [N]
	:%s/home.\{-}\zshome/alone  : Substitute only the occurrence of home in any line [N]
" find str but not on lines containing tongue
	^\(.*tongue.*\)\@!.*nose.*$
	\v^((tongue)@!.)*nose((tongue)@!.)*$
	.*nose.*\&^\%(\%(tongue\)\@!.\)*$ 
	:v/tongue/s/nose/&/gic
	'a,'bs/extrascost//gc       : trick: restrict search to between markers (answer n) [N]
"----------------------------------------
" *best-substitution*
	:%s/fred/joe/igc            : general substitute command
	:%s//joe/igc                : Substitute what you last searched for [N]
	:%s/~/sue/igc               : Substitute your last replacement string [N]
	:%s/\r//g                   : Delete DOS returns ^M
" Is your Text File jumbled onto one line? use following
	:%s/\r/\r/g                 : Turn DOS returns ^M into real returns
	:%s=  *$==                  : delete end of line blanks
	:%s= \+$==                  : Same thing
	:%s#\s*\r\?$##              : Clean both trailing spaces AND DOS returns
	:%s#\s*\r*$##               : same thing
" deleting empty lines
	:%s/^\n\{3}//               : delete blocks of 3 empty lines
	:%s/^\n\+/\r/               : compressing empty lines
	:%s#<[^>]\+>##g             : delete html tags, leave text (non-greedy)
	:%s#<\_.\{-1,}>##g          : delete html tags possibly multi-line (non-greedy)
	:%s#.*\(\d\+hours\).*#\1#   : Delete all but memorised string (\1) [N]
" parse xml/soap 
	%s#><\([^/]\)#>\r<\1#g      : split jumbled up XML file into one tag per line [N]
	%s/</\r&/g                  : simple split of html/xml/soap  [N]
	:%s#<[^/]#\r&#gic           : simple split of html/xml/soap  but not closing tag [N]
	:%s#<[^/]#\r&#gi            : parse on open xml tag [N]
	:%s#\[\d\+\]#\r&#g          : parse on numbered array elements [1] [N]
" VIM Power Substitute
	:'a,'bg/fred/s/dick/joe/igc : VERY USEFUL
" duplicating columns
	:%s= [^ ]\+$=&&=            : duplicate end column
	:%s= \f\+$=&&=              : Dupicate filename
	:%s= \S\+$=&&               : usually the same
" memory
	:%s#example#& = &#gic        : duplicate entire matched string [N]
	:%s#.*\(tbl_\w\+\).*#\1#    : extract list of all strings tbl_* from text  [NC]
	:s/\(.*\):\(.*\)/\2 : \1/   : reverse fields separated by :
	:%s/^\(.*\)\n\1$/\1/        : delete duplicate lines
	:%s/^\(.*\)\(\n\1\)\+$/\1/  : delete multiple duplicate lines [N]
" non-greedy matching \{-}
	:%s/^.\{-}pdf/new.pdf/      : delete to 1st occurence of pdf only (non-greedy)
	%s#^.\{-}\([0-9]\{3,4\}serial\)#\1#gic : delete up to 123serial or 1234serial [N]
" use of optional atom \?
	:%s#\<[zy]\?tbl_[a-z_]\+\>#\L&#gc : lowercase with optional leading characters
" over possibly many lines
	:%s/<!--\_.\{-}-->//        : delete possibly multi-line comments
	:help /\{-}                 : help non-greedy
" substitute using a register
	:s/fred/<c-r>a/g            : sub "fred" with contents of register "a"
	:s/fred/<c-r>asome_text<c-r>s/g  
	:s/fred/\=@a/g              : better alternative as register not displayed (not *) [C]
" multiple commands on one line
	:%s/\f\+\.gif\>/\r&\r/g | v/\.gif$/d | %s/gif/jpg/
	:%s/a/but/gie|:update|:next : then use @: to repeat
" ORing
	:%s/goat\|cow/sheep/gc      : ORing (must break pipe)
	:'a,'bs#\[\|\]##g           : remove [] from lines between markers a and b [N]
	:%s/\v(.*\n){5}/&\r         : insert a blank line every 5 lines [N]
" Calling a VIM function
	:s/__date__/\=strftime("%c")/ : insert datestring
	:inoremap \zd <C-R>=strftime("%d%b%y")<CR>    : insert date eg 31Jan11 [N]
" Working with Columns sub any str1 in col3
	:%s:\(\(\w\+\s\+\)\{2}\)str1:\1str2:
" Swapping first & last column (4 columns)
	:%s:\(\w\+\)\(.*\s\+\)\(\w\+\)$:\3\2\1:
" format a mysql query 
	:%s#\<from\>\|\<where\>\|\<left join\>\|\<\inner join\>#\r&#g
" filter all form elements into paste register
	:redir @*|sil exec 'g#<\(input\|select\|textarea\|/\=form\)\>#p'|redir END
	:nmap ,z :redir @*<Bar>sil exec 'g@<\(input\<Bar>select\<Bar>textarea\<Bar>/\=form\)\>@p'<Bar>redir END<CR>
" substitute string in column 30 [N]
	:%s/^\(.\{30\}\)xx/\1yy/
" decrement numbers by 3
	:%s/\d\+/\=(submatch(0)-3)/
" increment numbers by 6 on certain lines only
	:g/loc\|function/s/\d/\=submatch(0)+6/
" better
	:%s#txtdev\zs\d#\=submatch(0)+1#g
	:h /\zs
" increment only numbers gg\d\d  by 6 (another way)
	:%s/\(gg\)\@<=\d\+/\=submatch(0)+6/
	:h zero-width
" rename a string with an incrementing number
	:let i=10 | 'a,'bg/Abc/s/yy/\=i/ |let i=i+1 # convert yy to 10,11,12 etc
" as above but more precise
	:let i=10 | 'a,'bg/Abc/s/xx\zsyy\ze/\=i/ |let i=i+1 # convert xxyy to xx11,xx12,xx13    g/Abc/를 넣어야 순차적으로 변경 됨
" find replacement text, put in memory, then use \zs to simplify substitute
	:%s/"\([^.]\+\).*\zsxx/\1/
" Pull word under cursor into LHS of a substitute
	:nmap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>#
" Pull Visually Highlighted text into LHS of a substitute
	:vmap <leader>z :<C-U>%s/\<<c-r>*\>/
" substitute singular or plural
	:'a,'bs/bucket\(s\)*/bowl\1/gic   [N]
----------------------------------------
" all following performing similar task, substitute within substitution
" Multiple single character substitution in a portion of line only
	:%s,\(all/.*\)\@<=/,_,g     : replace all / with _ AFTER "all/"
" Same thing
	:s#all/\zs.*#\=substitute(submatch(0), '/', '_', 'g')#
" Substitute by splitting line, then re-joining
	:s#all/#&^M#|s#/#_#g|-j!
" Substitute inside substitute
	:%s/.*/\='cp '.submatch(0).' all/'.substitute(submatch(0),'/','_','g')/
----------------------------------------
" *best-global* command 
	:g/gladiolli/#              : display with line numbers (YOU WANT THIS!)
	:g/fred.*joe.*dick/         : display all lines fred,joe & dick
	:g/\<fred\>/                : display all lines fred but not freddy
	:g/^\s*$/d                  : delete all blank lines
	:g!/^dd/d                   : delete lines not containing string
	:v/^dd/d                    : delete lines not containing string
	:g/joe/,/fred/d             : not line based (very powerfull)
	:g/fred/,/joe/j             : Join Lines [N]
:g/-------/.-10,.d          : Delete string & 10 previous lines
	:g/{/ ,/}/- s/\n\+/\r/g     : Delete empty lines but only between {...}
	:v/\S/d                     : Delete empty lines (and blank lines ie whitespace)
	:v/./,/./-j                 : compress empty lines
	:g/^$/,/./-j                : compress empty lines
	:g/<input\|<form/p          : ORing
	:g/^/put_                   : double space file (pu = put)
	:g/^/m0                     : Reverse file (m = move)
	:g/^/m$                     : No effect! [N]
	:'a,'bg/^/m'b               : Reverse a section a to b
	:g/^/t.                     : duplicate every line
	:g/fred/t$                  : copy (transfer) lines matching fred to EOF
	:g/stage/t'a                : copy (transfer) lines matching stage to marker a (cannot use .) [C]
	:g/^Chapter/t.|s/./-/g      : Automatically underline selecting headings [N]
	:g/\(^I[^^I]*\)\{80}/d      : delete all lines containing at least 80 tabs
" perform a substitute on every other line
	:g/^/ if line('.')%2|s/^/zz / 
" match all lines containing "somestr" between markers a & b
" copy after line containing "otherstr"
	:'a,'bg/somestr/co/otherstr/ : co(py) or mo(ve)
" as above but also do a substitution
	:'a,'bg/str1/s/str1/&&&/|mo/str2/
	:%norm jdd                  : delete every other line
" incrementing numbers (type <c-a> as 5 characters)
	:.,$g/^\d/exe "norm! \<c-a>": increment numbers
	:'a,'bg/\d\+/norm! ^A       : increment numbers
" storing glob results (note must use APPEND) you need to empty reg a first with qaq. 
"save results to a register/paste buffer
	:g/fred/y A                 : append all lines fred to register a
	:g/fred/y A | :let @*=@a    : put into paste buffer
	:let @a=''|g/Barratt/y A |:let @*=@a
" filter lines to a file (file must already exist)
	:'a,'bg/^Error/ . w >> errors.txt
" duplicate every line in a file wrap a print '' around each duplicate
	:g/./yank|put|-1s/'/"/g|s/.*/Print '&'/
" replace string with contents of a file, -d deletes the "mark"
	:g/^MARK$/r tmp.txt | -d
" display prettily
	:g/<pattern>/z#.5           : display with context
	:g/<pattern>/z#.5|echo "=========="  : display beautifully
" Combining g// with normal mode commands
	:g/|/norm 2f|r*                      : replace 2nd | with a star
"send output of previous global command to a new window
	:nmap <F3>  :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>
"----------------------------------------
" *Best-Global-combined-with-substitute* (*power-editing*)
	:'a,'bg/fred/s/joe/susan/gic :  can use memory to extend matching
	:/fred/,/joe/s/fred/joe/gic :  non-line based (ultra)  여러줄에 걸쳐 fred로 시작하는 줄부터 joe로 끝나는 줄까지를 변경함
	:/biz/,/any/g/article/s/wheel/bucket/gic:  non-line based [N]
----------------------------------------
" Find fred before beginning search for joe
	:/fred/;/joe/-2,/sid/+3s/sally/alley/gIC
"----------------------------------------
" create a new file for each line of file eg 1.txt,2.txt,3,txt etc
	:g/^/exe ".w ".line(".").".txt"
"----------------------------------------
" chain an external command
	:.g/^/ exe ".!sed 's/N/X/'" | s/I/Q/    [N]
"----------------------------------------
" Operate until string found [N]
	d/fred/                                :delete until fred 라인 전까지
	d/fred                                 :delete until fred 문자 전까지
	y/fred/                                :yank until fred
	c/fred/e                               :change until fred end
	v12|                                   : visualise/change/delete to column 12 [N]
"----------------------------------------
" Summary of editing repeats [N]
	.      last edit (magic dot)
	:&     last substitute
	:%&    last substitute every line
	:%&gic last substitute every line confirm
	g%     normal mode repeat last substitute
	g&     last substitute on all lines
	@@     last recording
	@:     last command-mode command
	:!!    last :! command
	:~     last substitute
	:help repeating
----------------------------------------
" Summary of repeated searches
	;      last f, t, F or T
	,      last f, t, F or T in opposite direction
	n      last / or ? search
	N      last / or ? search in opposite direction
----------------------------------------
" *Absolutely-essential*
----------------------------------------
	* # g* g#           : find word under cursor (<cword>) (forwards/backwards)
	%                   : match brackets {}[]()
	.                   : repeat last modification 
	@:                  : repeat last : command (then @@)
	matchit.vim         : % now matches tags <tr><td><script> <?php etc
	<C-N><C-P>          : word completion in insert mode
	<C-X><C-L>          : Line complete SUPER USEFUL
	/<C-R><C-W>         : Pull <cword> onto search/command line
	/<C-R><C-A>         : Pull <CWORD> onto search/command line
	:set ignorecase     : you nearly always want this
	:set smartcase      : overrides ignorecase if uppercase used in search string (cool)
	:syntax on          : colour syntax in Perl,HTML,PHP etc
	:set syntax=perl    : force syntax (usually taken from file extension)
	:h regexp<C-D>      : type control-D and get a list all help topics containing
						  regexp (plus use TAB to Step thru list)
----------------------------------------
" MAKE IT EASY TO UPDATE/RELOAD _vimrc
	:nmap ,s :source $VIM/_vimrc
	:nmap ,v :e $VIM/_vimrc
	:e $MYVIMRC         : edits your _vimrc whereever it might be  [N]
" How to have a variant in your .vimrc for different PCs [N]
	if $COMPUTERNAME == "NEWPC"
	ab mypc vista
	else
	ab mypc dell25
	endif
----------------------------------------
" splitting windows
	:vsplit other.php       # vertically split current file with other.php [N]
----------------------------------------
"VISUAL MODE (easy to add other HTML Tags)
	:vmap sb "zdi<b><C-R>z</b><ESC>  : wrap <b></b> around VISUALLY selected Text
	:vmap st "zdi<?= <C-R>z ?><ESC>  : wrap <?=   ?> around VISUALLY selected Text
----------------------------------------
"vim 7 tabs
	vim -p fred.php joe.php             : open files in tabs
	:tabe fred.php                      : open fred.php in a new tab
	:tab ball                           : tab open files
	:close                              : close a tab but leave the buffer *N*
" vim 7 forcing use of tabs from .vimrc
	:nnoremap gf <C-W>gf
	:cab      e  tabe
	:tab sball                           : retab all files in buffer (repair) [N]
----------------------------------------
" Exploring
	:e .                            : file explorer
	:Exp(lore)                      : file explorer note capital Ex
	:Sex(plore)                     : file explorer in split window
	:browse e                       : windows style browser
	:ls                             : list of buffers
	:cd ..                          : move to parent directory
	:args                           : list of files
	:pwd                            : Print Working Directory (current directory) [N]
	:args *.php                     : open list of files (you need this!)
	:lcd %:p:h                      : change to directory of current file
	:autocmd BufEnter * lcd %:p:h   : change to directory of current file automatically (put in _vimrc)
----------------------------------------
" Changing Case
	guu                             : lowercase line
	gUU                             : uppercase line
	Vu                              : lowercase line
	VU                              : uppercase line
	g~~                             : flip case line
	vEU                             : Upper Case Word
	vE~                             : Flip Case Word
	ggguG                           : lowercase entire file
" Titlise Visually Selected Text (map for .vimrc)
	vmap ,c :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>
" Title Case A Line Or Selection (better)
	vnoremap <F6> :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr> [N]
" titlise a line
	nmap ,t :s/.*/\L&/<bar>:s/\<./\u&/g<cr>  [N]
" Uppercase first letter of sentences
	:%s/[.!?]\_s\+\a/\U&\E/g
----------------------------------------
	gf                              : open file name under cursor (SUPER)
	:nnoremap gF :view <cfile><cr>  : open file under cursor, create if necessary
	ga                              : display hex,ascii value of char under cursor
	ggVGg?                          : rot13 whole file
	ggg?G                           : rot13 whole file (quicker for large file)
	:8 | normal VGg?                : rot13 from line 8
	:normal 10GVGg?                 : rot13 from line 8
	<C-A>,<C-X>                     : increment,decrement number under cursor
									  win32 users must remap CNTRL-A
	<C-R>=5*5                       : insert 25 into text (mini-calculator)
----------------------------------------
" Make all other tips superfluous
	:h 42            : also http://www.google.com/search?q=42
	:h holy-grail
	:h!
----------------------------------------
" disguise text (watch out) [N]
	ggVGg?                          : rot13 whole file (toggles)
	:set rl!                        : reverse lines right to left (toggles)
	:g/^/m0                         : reverse lines top to bottom (toggles)
	:%s/\(\<.\{-}\>\)/\=join(reverse(split(submatch(1), '.\zs')), '')/g   : reverse all text *N*
----------------------------------------
" History, Markers & moving about (what Vim Remembers) [C]
	'.               : jump to last modification line (SUPER)
	`.               : jump to exact spot in last modification line
	g;               : cycle thru recent changes (oldest first)
	g,               : reverse direction 
	:changes
	:h changelist    : help for above
	<C-O>            : retrace your movements in file (starting from most recent)
	<C-I>            : retrace your movements in file (reverse direction)
	:ju(mps)         : list of your movements
	:help jump-motions
	:history         : list of all your commands
	:his c           : commandline history
	:his s           : search history
	q/               : Search history Window (puts you in full edit mode) (exit CTRL-C)
	q:               : commandline history Window (puts you in full edit mode) (exit CTRL-C)
	:<C-F>           : history Window (exit CTRL-C)
----------------------------------------
" Abbreviations & Maps
" Maps are commands put onto keys, abbreviations expand typed text [N]
" Following 4 maps enable text transfer between VIM sessions
	:map   <f7>   :'a,'bw! c:/aaa/x       : save text to file x
	:map   <f8>   :r c:/aaa/x             : retrieve text 
	:map   <f11>  :.w! c:/aaa/xr<CR>      : store current line
	:map   <f12>  :r c:/aaa/xr<CR>        : retrieve current line
	:ab php          : list of abbreviations beginning php
	:map ,           : list of maps beginning ,
" allow use of F10 for mapping (win32)
	set wak=no       : :h winaltkeys
" For use in Maps
	<CR>             : carriage Return for maps
	<ESC>            : Escape
	<LEADER>         : normally \
	<BAR>            : | pipe
	<BACKSPACE>      : backspace
	<SILENT>         : No hanging shell window
"display RGB colour under the cursor eg #445588
	:nmap <leader>c :hi Normal guibg=#<c-r>=expand("<cword>")<cr><cr>
	map <f2> /price only\\|versus/ :in a map need to backslash the \
" type table,,, to get <table></table>       ### Cool ###
	imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>kA
" list current mappings of all your function keys
	:for i in range(1, 12) | execute("map <F".i.">") | endfor   [N]
" for your .vimrc
	:cab ,f :for i in range(1, 12) \| execute("map <F".i.">") \| endfor
"chain commands in abbreviation
	cabbrev vrep tabe class.inc \| tabe report.php   ## chain commands [N]
----------------------------------------
" Simple PHP debugging display all variables yanked into register a
	iab phpdb exit("<hr>Debug <C-R>a  ");
----------------------------------------
" Using a register as a map (preload registers in .vimrc)
	:let @m=":'a,'bs/"
	:let @s=":%!sort -u"
----------------------------------------
" Useful tricks
"ayy@a           : execute "Vim command" in a text file
	yy@"             : same thing using unnamed register
	u@.              : execute command JUST typed in
"ddw             : store what you delete in register d [N]
"ccaw            : store what you change in register c [N]
----------------------------------------
" Get output from other commands (requires external programs)
	:r!ls -R         : reads in output of ls
	:put=glob('**')  : same as above                 [N]
	:r !grep "^ebay" file.txt  : grepping in content   [N]
	:20,25 !rot13    : rot13 lines 20 to 25   [N]
	!!date           : same thing (but replaces/filters current line)
" Sorting with external sort
	:%!sort -u       : use an external program to filter content
	:'a,'b!sort -u   : use an external program to filter content
	!1} sort -u      : sorts paragraph (note normal mode!!)
	:g/^$/;/^$/-1!sort : Sort each block (note the crucial ;)
" Sorting with internal sort
	:sort /.*\%2v/   : sort all lines on second column [N]
" number lines  (linux or cygwin only)
	:new | r!nl #                  [N]
----------------------------------------
" Multiple Files Management (Essential)
	:bn              : goto next buffer
	:bp              : goto previous buffer
	:wn              : save file and move to next (super)
	:wp              : save file and move to previous
	:bd              : remove file from buffer list (super)
	:bun             : Buffer unload (remove window but not from list)
	:badd file.c     : file from buffer list
	:b3              : go to buffer 3 [C]
	:b main          : go to buffer with main in name eg main.c (ultra)
	:sav php.html    : Save current file as php.html and "move" to php.html
	:sav! %<.bak     : Save Current file to alternative extension (old way)
	:sav! %:r.cfm    : Save Current file to alternative extension
	:sav %:s/fred/joe/           : do a substitute on file name
	:sav %:s/fred/joe/:r.bak2    : do a substitute on file name & ext.
	:!mv % %:r.bak   : rename current file (DOS use Rename or DEL)
	:help filename-modifiers
	:e!              : return to unmodified file
	:w c:/aaa/%      : save file elsewhere
	:e #             : edit alternative file (also cntrl-^)
	:rew             : return to beginning of edited files list (:args)
	:brew            : buffer rewind
	:sp fred.txt     : open fred.txt into a split
	:sball,:sb       : Split all buffers (super)
	:scrollbind      : in each split window
	:map   <F5> :ls<CR>:e # : Pressing F5 lists all buffer, just type number
	:set hidden      : Allows to change buffer w/o saving current buffer
----------------------------------------
" Quick jumping between splits
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
----------------------------------------
" Recording (BEST Feature of ALL)
	qq  # record to q
	your complex series of commands
	q   # end recording
	@q to execute
	@@ to Repeat
	5@@ to Repeat 5 times
	qQ@qq                             : Make an existing recording q recursive [N]
" editing a register/recording
"qp                               :display contents of register q (normal mode)
	<ctrl-R>q                         :display contents of register q (insert mode)
" you can now see recording contents, edit as required
"qdd                              :put changed contacts back into q
	@q                                :execute recording/register q
" Operating a Recording on a Visual BLOCK (blockwise)
	1) define recording/register
	qq:s/ to/ from/g^Mq
	2) Define Visual BLOCK
	V}
	3) hit : and the following appears
	:'<,'>
	4)Complete as follows
	:'<,'>norm @q
----------------------------------------
"combining a recording with a map (to end up in command mode)
"here we operate on a file with a recording, then move to the next file [N]
	:nnoremap ] @q:update<bar>bd
----------------------------------------
" Visual is the newest and usually the most intuitive editing mode
" Visual basics
	v                               : enter visual mode
	V                               : visual mode whole line
	<C-V>                           : enter VISUAL BLOCKWISE mode (remap on Windows to say C-Q *C*
	gv                              : reselect last visual area (ultra)
	o                               : navigate visual area
"*y or "+y                      : yank visual area into paste buffer  [C]
	V%                              : visualise what you match
	V}J                             : Join Visual block (great)
	V}gJ                            : Join Visual block w/o adding spaces
	`[v`]                           : Highlight last insert
	:%s/\%Vold/new/g                : Do a substitute on last visual area [N]
----------------------------------------
" Delete 8th and 9th characters of 10 successive lines [C]
	08l<c-v>10j2ld  (use Control Q on win32) [C]
----------------------------------------
" how to copy a set of columns using VISUAL BLOCK
" visual block (AKA columnwise selection) (NOT BY ordinary v command)
	<C-V> then select "column(s)" with motion commands (win32 <C-Q>)
	then c,d,y,r etc
----------------------------------------
" how to overwrite a visual-block of text with another such block [C]
" move with hjkl etc
	Pick the first block: ctrl-v move y
	Pick the second block: ctrl-v move P <esc>
----------------------------------------
" text objects :h text-objects                                     [C]
	daW                                   : delete contiguous non whitespace
	di<   yi<  ci<                        : Delete/Yank/Change HTML tag contents
	da<   ya<  ca<                        : Delete/Yank/Change whole HTML tag
	dat   dit                             : Delete HTML tag pair
	diB   daB                             : Empty a function {}
	das                                   : delete a sentence
----------------------------------------
" _vimrc essentials
	:imap <TAB> <C-N>                     : set tab to complete [N]
	:set incsearch : jumps to search word as you type (annoying but excellent)
	:set wildignore=*.o,*.obj,*.bak,*.exe : tab complete now ignores these
	:set shiftwidth=3                     : for shift/tabbing
	:set vb t_vb=".                       : set silent (no beep)
	:set browsedir=buffer                 : Maki GUI File Open use current directory
----------------------------------------
" launching Win IE
	:nmap ,f :update<CR>:silent !start c:\progra~1\intern~1\iexplore.exe file://%:p<CR>
	:nmap ,i :update<CR>: !start c:\progra~1\intern~1\iexplore.exe <cWORD><CR>
----------------------------------------
" FTPing from VIM
	cmap ,r  :Nread ftp://209.51.134.122/public_html/index.html
	cmap ,w  :Nwrite ftp://209.51.134.122/public_html/index.html
	gvim ftp://www.somedomain.com/index.html # uses netrw.vim
----------------------------------------
" appending to registers (use CAPITAL)
" yank 5 lines into "a" then add a further 5
"a5yy
	10j
"A5yy
----------------------------------------
	[I     : show lines matching word under cursor <cword> (super)
----------------------------------------
" Conventional Shifting/Indenting
	:'a,'b>>
" visual shifting (builtin-repeat)
	:vnoremap < <gv
	:vnoremap > >gv
" Block shifting (magic)
	>i{
	>a{
" also
	>% and <%
	==                            : index current line same as line above [N]
----------------------------------------
" Redirection & Paste register *
	:redir @*                    : redirect commands to paste buffer
	:redir END                   : end redirect
	:redir >> out.txt            : redirect to a file
" Working with Paste buffer
"*yy                         : yank curent line to paste
"*p                          : insert from paste buffer
" yank to paste buffer (ex mode)
	:'a,'by*                     : Yank range into paste
	:%y*                         : Yank whole buffer into paste
	:.y*                         : Yank Current line to paster
" filter non-printable characters from the paste buffer
" useful when pasting from some gui application
	:nmap <leader>p :let @* = substitute(@*,'[^[:print:]]','','g')<cr>"*p
	:set paste                    : prevent vim from formatting pasted in text *N*
----------------------------------------
" Re-Formatting text
	gq}                          : Format a paragraph
	gqap                         : Format a paragraph
	ggVGgq                       : Reformat entire file
	Vgq                          : current line
" break lines at 70 chars, if possible after a ;
	:s/.\{,69\};\s*\|.\{,69\}\s\+/&\r/g
----------------------------------------
" Operate command over multiple files
	:argdo %s/foo/bar/e          : operate on all files in :args
	:bufdo %s/foo/bar/e
	:windo %s/foo/bar/e
	:argdo exe '%!sort'|w!       : include an external command
	:bufdo exe "normal @q" | w   : perform a recording on open files
	:silent bufdo !zip proj.zip %:p   : zip all current files
----------------------------------------
" Command line tricks
	gvim -h                    : help
	ls | gvim -                : edit a stream!!
	cat xx | gvim - -c "v/^\d\d\|^[3-9]/d " : filter a stream
	gvim -o file1 file2        : open into a horizontal split (file1 on top, file2 on bottom) [C]
	gvim -O file1 file2        : open into a vertical split (side by side,for comparing code) [N]
" execute one command after opening file
	gvim.exe -c "/main" joe.c  : Open joe.c & jump to "main"
" execute multiple command on a single file
	vim -c "%s/ABC/DEF/ge | update" file1.c
" execute multiple command on a group of files
	vim -c "argdo %s/ABC/DEF/ge | update" *.c
" remove blocks of text from a series of files
	vim -c "argdo /begin/+1,/end/-1g/^/d | update" *.c
" Automate editing of a file (Ex commands in convert.vim)
	vim -s "convert.vim" file.c
"load VIM without .vimrc and plugins (clean VIM) e.g. for HUGE files
	gvim -u NONE -U NONE -N
" Access paste buffer contents (put in a script/batch file)
	gvim -c 'normal ggdG"*p' c:/aaa/xp
" print paste contents to default printer
	gvim -c 's/^/\=@*/|hardcopy!|q!'
" gvim's use of external grep (win32 or *nix)
	:!grep somestring *.php     : creates a list of all matching files [C]
" use :cn(ext) :cp(rev) to navigate list
	:h grep
" Using vimgrep with copen                              [N]
	:vimgrep /keywords/ *.php
	:copen
----------------------------------------
" GVIM Difference Function (Brilliant)
	gvim -d file1 file2        : vimdiff (compare differences)
	dp                         : "put" difference under cursor to other file
	do                         : "get" difference under cursor from other file
" complex diff parts of same file [N]
	:1,2yank a | 7,8yank b
	:tabedit | put a | vnew | put b
	:windo diffthis 
----------------------------------------
" Vim traps
	In regular expressions you must backslash + (match 1 or more)
	In regular expressions you must backslash | (or)
	In regular expressions you must backslash ( (group)
	In regular expressions you must backslash { (count)
	/fred\+/                   : matches fred/freddy but not free
	/\(fred\)\{2,3}/           : note what you have to break
----------------------------------------
" \v or very magic (usually) reduces backslashing
	/codes\(\n\|\s\)*where  : normal regexp
	/\vcodes(\n|\s)*where   : very magic
----------------------------------------
" pulling objects onto command/search line (SUPER)
	<C-R><C-W> : pull word under the cursor into a command line or search
	<C-R><C-A> : pull WORD under the cursor into a command line or search
	<C-R>-                  : pull small register (also insert mode)
	<C-R>[0-9a-z]           : pull named registers (also insert mode)
	<C-R>%                  : pull file name (also #) (also insert mode)
	<C-R>=somevar           : pull contents of a variable (eg :let sray="ray[0-9]")
----------------------------------------
" List your Registers
	:reg             : display contents of all registers
	:reg a           : display content of register a
	:reg 12a         : display content of registers 1,2 & a [N]
"5p              : retrieve 5th "ring" 
"1p....          : retrieve numeric registers one by one
	:let @y='yy@"'   : pre-loading registers (put in .vimrc)
	qqq              : empty register "q"
	qaq              : empty register "a"
	:reg .-/%:*"     : the seven special registers [N]
	:reg 0           : what you last yanked, not affected by a delete [N]
"_dd             : Delete to blackhole register "_ , don't affect any register [N]
----------------------------------------
" manipulating registers
	:let @a=@_              : clear register a
	:let @a=""              : clear register a
	:let @a=@"              : Save unnamed register [N]
	:let @*=@a              : copy register a to paste buffer
	:let @*=@:              : copy last command to paste buffer
	:let @*=@/              : copy last search to paste buffer
	:let @*=@%              : copy current filename to paste buffer
----------------------------------------
" help for help (USE TAB)
	:h quickref             : VIM Quick Reference Sheet (ultra)
	:h tips                 : Vim's own Tips Help
	:h visual<C-D><tab>     : obtain  list of all visual help topics
							: Then use tab to step thru them
	:h ctrl<C-D>            : list help of all control keys
	:helpg uganda           : grep HELP Files use :cn, :cp to find next
	:helpgrep edit.*director: grep help using regexp
	:h :r                   : help for :ex command
	:h CTRL-R               : normal mode
	:h /\r                  : what's \r in a regexp (matches a <CR>)
	:h \\zs                 : double up backslash to find \zs in help
	:h i_CTRL-R             : help for say <C-R> in insert mode
	:h c_CTRL-R             : help for say <C-R> in command mode
	:h v_CTRL-V             : visual mode
	:h tutor                : VIM Tutor
	<C-]>                   : jump to {keyword} under  cursor in help file [C]
	<C-[>, <C-T>            : Move back & Forth in HELP History
	gvim -h                 : VIM Command Line Help
	:cabbrev h tab help     : open help in a tab [N]
----------------------------------------
" where was an option set
	:scriptnames            : list all plugins, _vimrcs loaded (super)
	:verbose set history?   : reveals value of history and where set
	:function               : list functions
	:func SearchCompl       : List particular function
----------------------------------------
" making your own VIM help
	:helptags /vim/vim64/doc  : rebuild all *.txt help files in /doc
	:help add-local-help
" save this page as a VIM Help File [N]
	:sav! $VIMRUNTIME/doc/vimtips.txt|:1,/^__BEGIN__/d|:/^__END__/,$d|:w!|:helptags $VIMRUNTIME/doc
----------------------------------------
" running file thru an external program (eg php)
	map   <f9>   :w<CR>:!c:/php/php.exe %<CR>
	map   <f2>   :w<CR>:!perl -c %<CR>
----------------------------------------
" capturing output of current script in a separate buffer
	:new | r!perl #                   : opens new buffer,read other buffer
	:new! x.out | r!perl #            : same with named file
	:new+read!ls
----------------------------------------
" create a new buffer, paste a register "q" into it, then sort new buffer
	:new +put q|%!sort
----------------------------------------
" Inserting DOS Carriage Returns
	:%s/$/\<C-V><C-M>&/g          :  that's what you type
	:%s/$/\<C-Q><C-M>&/g          :  for Win32
	:%s/$/\^M&/g                  :  what you'll see where ^M is ONE character
----------------------------------------
" automatically delete trailing Dos-returns,whitespace
	autocmd BufRead * silent! %s/[\r \t]\+$//
	autocmd BufEnter *.php :%s/[ \t\r]\+$//e
----------------------------------------
" perform an action on a particular file or file type
	autocmd VimEnter c:/intranet/note011.txt normal! ggVGg?
	autocmd FileType *.pl exec('set fileformats=unix')
----------------------------------------
" Retrieving last command line command for copy & pasting into text
	i<c-r>:
" Retrieving last Search Command for copy & pasting into text
	i<c-r>/
----------------------------------------
" more completions
	<C-X><C-F>                        :insert name of a file in current directory
----------------------------------------
" Substituting a Visual area
" select visual area as usual (:h visual) then type :s/Emacs/Vim/ etc
	:'<,'>s/Emacs/Vim/g               : REMEMBER you dont type the '<.'>
	gv                                : Re-select the previous visual area (ULTRA)
----------------------------------------
" inserting line number into file
	:g/^/exec "s/^/".strpart(line(".")."    ", 0, 4)
	:%s/^/\=strpart(line(".")."     ", 0, 5)
	:%s/^/\=line('.'). ' '
----------------------------------------
" *numbering lines VIM way*
	:set number                       : show line numbers
	:map <F12> :set number!<CR>       : Show linenumbers flip-flop
	:%s/^/\=strpart(line('.')."        ",0,&ts)
" numbering lines (need Perl on PC) starting from arbitrary number
	:'a,'b!perl -pne 'BEGIN{$a=223} substr($_,2,0)=$a++'
" Produce a list of numbers
" Type in number on line say 223 in an empty file
	qqmnYP`n^Aq                       : in recording q repeat with @q
" increment existing numbers to end of file (type <c-a> as 5 characters)
	:.,$g/^\d/exe "normal! \<c-a>"
" advanced incrementing
	http://vim.sourceforge.net/tip_view.php?tip_id=150
----------------------------------------
" *advanced incrementing* (really useful)
" put following in _vimrc
	let g:I=0
	function! INC(increment)
	let g:I =g:I + a:increment
	return g:I
	endfunction
" eg create list starting from 223 incrementing by 5 between markers a,b
	:let I=223
	:'a,'bs/^/\=INC(5)/
" create a map for INC
	cab viminc :let I=223 \| 'a,'bs/$/\=INC(5)/
----------------------------------------
" *generate a list of numbers*  23-64
	o23<ESC>qqYp<C-A>q40@q
----------------------------------------
" editing/moving within current insert (Really useful)
	<C-U>                             : delete all entered
	<C-W>                             : delete last word
	<HOME><END>                       : beginning/end of line
	<C-LEFTARROW><C-RIGHTARROW>       : jump one word backwards/forwards
	<C-X><C-E>,<C-X><C-Y>             : scroll while staying put in insert
----------------------------------------
	#encryption (use with care: DON'T FORGET your KEY)
	:X                                : you will be prompted for a key
	:h :X
----------------------------------------
" modeline (make a file readonly etc) must be in first/last 5 lines
	// vim:noai:ts=2:sw=4:readonly:
" vim:ft=html:                    : says use HTML Syntax highlighting
	:h modeline
----------------------------------------
" Creating your own GUI Toolbar entry
	amenu  Modeline.Insert\ a\ VIM\ modeline <Esc><Esc>ggOvim:ff=unix ts=4 ss=4<CR>vim60:fdm=marker<esc>gg
----------------------------------------
" A function to save word under cursor to a file
	function! SaveWord()
	   normal yiw
	   exe ':!echo '.@0.' >> word.txt'
	endfunction
	map ,p :call SaveWord()
----------------------------------------
" function to delete duplicate lines
	function! Del()
	 if getline(".") == getline(line(".") - 1)
	   norm dd
	 endif
	endfunction
	
	:g/^/ call Del()
----------------------------------------
" Digraphs (non alpha-numerics)
	:digraphs                         : display table
	:h dig                            : help
	i<C-K>e'                          : enters é
	i<C-V>233                         : enters é (Unix)
	i<C-Q>233                         : enters é (Win32)
	ga                                : View hex value of any character
	#Deleting non-ascii characters (some invisible)
	:%s/[\x00-\x1f\x80-\xff]/ /g      : type this as you see it
	:%s/[<C-V>128-<C-V>255]//gi       : where you have to type the Control-V
	:%s/[€-ÿ]//gi                     : Should see a black square & a dotted y
	:%s/[<C-V>128-<C-V>255<C-V>01-<C-V>31]//gi : All pesky non-asciis
	:exec "norm /[\x00-\x1f\x80-\xff]/"        : same thing
	#Pull a non-ascii character onto search bar
	yl/<C-R>"                         :
	/[^a-zA-Z0-9_[:space:][:punct:]]  : search for all non-ascii
----------------------------------------
" All file completions grouped (for example main_c.c)
	:e main_<tab>                     : tab completes
	gf                                : open file under cursor  (normal)
	main_<C-X><C-F>                   : include NAME of file in text (insert mode)
----------------------------------------
" Complex Vim
" swap two words
	:%s/\<\(on\|off\)\>/\=strpart("offon", 3 * ("off" == submatch(0)), 3)/g
" swap two words
	:vnoremap <C-X> <Esc>`.``gvP``P
" Swap word with next word
	nmap <silent> gw    "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l> [N]
----------------------------------------
" Convert Text File to HTML
	:runtime! syntax/2html.vim        : convert txt to html
	:h 2html
----------------------------------------
" VIM has internal grep
	:grep some_keyword *.c            : get list of all c-files containing keyword
	:cn                               : go to next occurrence
----------------------------------------
" Force Syntax coloring for a file that has no extension .pl
	:set syntax=perl
" Remove syntax coloring (useful for all sorts of reasons)
	:set syntax off
" change coloring scheme (any file in ~vim/vim??/colors)
	:colorscheme blue
	:colorscheme morning     : good fallback colorscheme *N*
" Force HTML Syntax highlighting by using a modeline
	# vim:ft=html:
" Force syntax automatically (for a file with non-standard extension)
	au BufRead,BufNewFile */Content.IE?/* setfiletype html
----------------------------------------
	:set noma (non modifiable)        : Prevents modifications
	:set ro (Read Only)               : Protect a file from unintentional writes
----------------------------------------
" Sessions (Open a set of files)
	gvim file1.c file2.c lib/lib.h lib/lib2.h : load files for "session"
	:mksession                        : Make a Session file (default Session.vim)
	:mksession MySession.vim          : Make a Session file named file [C]
	:q
	gvim -S                           : Reload all files (loads Session.vim) [C]
	gvim -S MySession.vim             : Reload all files from named session [C]
----------------------------------------
	#tags (jumping to subroutines/functions)
	taglist.vim                       : popular plugin
	:Tlist                            : display Tags (list of functions)
	<C-]>                             : jump to function under cursor
----------------------------------------
" columnise a csv file for display only as may crop wide columns
	:let width = 20
	:let fill=' ' | while strlen(fill) < width | let fill=fill.fill | endwhile
	:%s/\([^;]*\);\=/\=strpart(submatch(1).fill, 0, width)/ge
	:%s/\s\+$//ge
" Highlight a particular csv column (put in .vimrc)
	function! CSVH(x)
		execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
		execute 'normal ^'.a:x.'f,'
	endfunction
	command! -nargs=1 Csv :call CSVH(<args>)
" call with
	:Csv 5                             : highlight fifth column
----------------------------------------
	zf1G      : fold everything before this line [N]
" folding : hide sections to allow easier comparisons
	zf}                               : fold paragraph using motion
	v}zf                              : fold paragraph using visual
	zf'a                              : fold to mark
	zo                                : open fold
	zc                                : re-close fold
" also visualise a section of code then type zf [N]
	:help folding
	zfG      : fold everything after this line [N]
----------------------------------------
" displaying "non-asciis"
	:set list
	:h listchars
----------------------------------------
" How to paste "normal vim commands" w/o entering insert mode
	:norm qqy$jq
----------------------------------------
" manipulating file names
	:h filename-modifiers             : help
	:w %                              : write to current file name
	:w %:r.cfm                        : change file extention to .cfm
	:!echo %:p                        : full path & file name
	:!echo %:p:h                      : full path only
	:!echo %:t                        : filename only
	:reg %                            : display filename
	<C-R>%                            : insert filename (insert mode)
"%p                               : insert filename (normal mode)
	/<C-R>%                           : Search for file name in text
----------------------------------------
" delete without destroying default buffer contents
"_d                               : what you've ALWAYS wanted
"_dw                              : eg delete word (use blackhole)
----------------------------------------
" pull full path name into paste buffer for attachment to email etc
	nnoremap <F2> :let @*=expand("%:p")<cr> :unix
	nnoremap <F2> :let @*=substitute(expand("%:p"), "/", "\\", "g")<cr> :win32
----------------------------------------
" Simple Shell script to rename files w/o leaving vim
	$ vim
	:r! ls *.c
	:%s/\(.*\).c/mv & \1.bla
	:w !sh
	:q!
----------------------------------------
" count words/lines in a text file
	g<C-G>                                 # counts words
	:echo line("'b")-line("'a")            # count lines between markers a and b [N]
	:'a,'bs/^//n                           # count lines between markers a and b
	:'a,'bs/somestring//gn                 # count occurences of a string
----------------------------------------
" example of setting your own highlighting
	:syn match DoubleSpace "  "
	:hi def DoubleSpace guibg=#e0e0e0
----------------------------------------
" reproduce previous line word by word
	imap ]  @@@<ESC>hhkyWjl?@@@<CR>P/@@@<CR>3s
	nmap ] i@@@<ESC>hhkyWjl?@@@<CR>P/@@@<CR>3s
" Programming keys depending on file type
	:autocmd bufenter *.tex map <F1> :!latex %<CR>
	:autocmd bufenter *.tex map <F2> :!xdvi -hush %<.dvi&<CR>
" allow yanking of php variables with their dollar [N]
	:autocmd bufenter *.php :set iskeyword+=\$ 
----------------------------------------
" reading Ms-Word documents, requires antiword (not docx)
	:autocmd BufReadPre *.doc set ro
	:autocmd BufReadPre *.doc set hlsearch!
	:autocmd BufReadPost *.doc %!antiword "%"
----------------------------------------
" a folding method
	vim: filetype=help foldmethod=marker foldmarker=<<<,>>>
	A really big section closed with a tag <<< 
	--- remember folds can be nested --- 
	Closing tag >>> 
----------------------------------------
" Return to last edit position (You want this!) [N]
	autocmd BufReadPost *
		 \ if line("'\"") > 0 && line("'\"") <= line("$") |
		 \   exe "normal! g`\"" |
		 \ endif
----------------------------------------
" store text that is to be changed or deleted in register a
"act<                                 :  Change Till < [N]
----------------------------------------
"installing/getting latest version of vim on Linux (replace tiny-vim) [N]
	yum install vim-common vim-enhanced vim-minimal
----------------------------------------
	# using gVIM with Cygwin on a Windows PC
	if has('win32')
	source $VIMRUNTIME/mswin.vim
	behave mswin
	set shell=c:\\cygwin\\bin\\bash.exe shellcmdflag=-c shellxquote=\"
	endif
----------------------------------------
" *Just Another Vim Hacker JAVH*
	vim -c ":%s%s*%Cyrnfr)fcbafbe[Oenz(Zbbyranne%|:%s)[[()])-)Ig|norm Vg?"
----------------------------------------
	vim:tw=78:ts=8:ft=help:norl:
	__END__
----------------------------------------
"Read Vimtips into a new vim buffer (needs w3m.sourceforge.net)
	:tabe | :r ! w3m -dump "http://zzapper.co.uk/vimtips.html"    [C]
	:silent r ! lynx -dump "http://zzapper.co.uk/vimtips.html" [N]
" read webpage source html into vim
	gvim http://www.zzapper.co.uk/vimtips.html &
----------------------------------------
	updated version at http://www.zzapper.co.uk/vimtips.html
----------------------------------------
	Please email any errors, tips etc to
	vim@rayninfo.co.uk
" Information Sources
----------------------------------------
	www.vim.org
	Vim Wiki *** VERY GOOD *** [N]
	Vim Use VIM newsgroup [N]
	comp.editors
	groups.yahoo.com/group/vim "VIM" specific newsgroup
	VIM Webring
	VimTips PDF Version (PRINTABLE!)
	Vimtips in Belarusian 
----------------------------------------



named group
<(?P<tag>[a-z][a-z0-9]*)\b[^>]*>.*?<\/(?P=tag)>   

\b\w : \b 단어의 시작 \w 한글자    	abc -> a
\B\w : \B 단어의 사작 제외 \w 한글자  abc -> bc
\w{2, 3} : 최대로 큰 것 찾음    		abcd -> abc
\w{2, 3}? : 최대로 작은 것 찾음   	abcd -> ab cd
[a] : []로 감싸있는 것           		abc -> a    
[^a] : []로 감싸있는 것을 제외한 것 	abc -> b c  
\w : 한 글자(알파벳 + 숫자) ()
\W : 알파벳+숫자 이외
.  : 한 글자 (모든)
\s : space
\S : space이외
\d : 숫자
\D : 숫자 이외






******** Zen Cording ********
CSS
Flexbox
	d:f display: flex
	ai:c align-items: center
	ai:fs align-items: flex-start
	ai:fe align-items: flex-end
	jc:c justify-content: center
	jc:fs justify-content: flex-start
	jc:fe justify-content: flex-end
	jc:sa justify-content: space-around
	jc:sb justify-content: space-between
	fx flex
	fxg flex-grow
	fxsh flex-shrink
	fxw flex-wrap
	fxd flex-direction
	fxd:c flex-direction: column
	as:c align-self: center
	as:fs align-self: flex-start
	as:fe align-self: flex-end
Fonts
	fs font-size
	ff font-family
	fw font-weight
Color
	c color
	c:ra color rgba
	op opacity
Padding
	p padding
	pr padding-right
	pl padding-left
	pt padding-top
	pb padding-bottom
Margin
	m margin
	mr margin-right
	ml margin-left
	mt margin-top
	mb margin-bottom
Display
	d:ib display: inline-block
	d:i display: inline
	d:n display: none
	d:b display: block
Visibility
	v:h visibility: hidden	
Overflow
	ov:h overflow: hidden
	ov:v overflow: visible
	ov:s overflow: scroll
	ov:a overflow: auto
	ovx:h overflow-x: hidden
	ovx:v overflow-x: visible
	ovx:s overflow-x: scroll
	ovx:a overflow-x: auto
	ovy:h verflow-y: hidden
	ovy:v overflow-y: visible
	ovy:s overflow-y: scroll
	ovy:a overflow-y: auto
Cursor
	cur:p cursor: pointer
Position
	pos:r position: relative
	pos:a position: absolute
	pos:s position: static
	pos:f position: fixed
Width && Height
	w width
	maw max-width
	miw min-width
	h height
	mah max-height
	mih min-height



HTML
    div
    <div></div>

    .container
    <div class="container"></div>

    #mainContent
    <div id="mainContent"></div>

    div>h1
    <div>
      <h1></h1>
    </div>

    div>div>h1
    <div>
      <div>
        <h1></h1>
      </div>
    </div>

    ul.wrap>li*4
    <ul class="wrap">
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>

    ul.wrap>li#item$*4
    <ul class="wrap">
      <li id="item1"></li>
      <li id="item2"></li>
      <li id="item3"></li>
      <li id="item4"></li>
    </ul>

    ul.wrap>li#item$$*4
    <ul class="wrap">
      <li id="item01"></li>
      <li id="item02"></li>
      <li id="item03"></li>
      <li id="item04"></li>
    </ul>

    ul.wrap>li#item$$.col-md-4*4
    <ul class="wrap">
      <li id="item01" class="col-md-4"></li>
      <li id="item02" class="col-md-4"></li>
      <li id="item03" class="col-md-4"></li>
      <li id="item04" class="col-md-4"></li>
    </ul>

    ul.wrap>li#item$$.col-md-4*4>h2
    <ul class="wrap">
      <li id="item01" class="col-md-4">
        <h2></h2>
      </li>
      <li id="item02" class="col-md-4">
        <h2></h2>
      </li>
      <li id="item03" class="col-md-4">
        <h2></h2>
      </li>
      <li id="item04" class="col-md-4">
        <h2></h2>
      </li>
    </ul>

    ul.wrap>li#item$$.col-md-4*4>h2+p
    <ul class="wrap">
      <li id="item01" class="col-md-4">
        <h2></h2>
        <p></p>
      </li>
      <li id="item02" class="col-md-4">
        <h2></h2>
        <p></p>
      </li>
      <li id="item03" class="col-md-4">
        <h2></h2>
        <p></p>
      </li>
      <li id="item04" class="col-md-4">
        <h2></h2>
        <p></p>
      </li>
    </ul>

    ul.wrap>li#item$$.col-md-4*4>h2{안녕}+p
    <ul class="wrap">
      <li id="item01" class="col-md-4">
        <h2>안녕</h2>
        <p></p>
      </li>
      <li id="item02" class="col-md-4">
        <h2>안녕</h2>
        <p></p>
      </li>
      <li id="item03" class="col-md-4">
        <h2>안녕</h2>
        <p></p>
      </li>
      <li id="item04" class="col-md-4">
        <h2>안녕</h2>
        <p></p>
      </li>
    </ul>

    ul.wrap>li#item$$.col-md-4*4>h2{안녕}+p{반갑습니다.}
    <ul class="wrap">
      <li id="item01" class="col-md-4">
        <h2>안녕</h2>
        <p>반갑습니다.</p>
      </li>
      <li id="item02" class="col-md-4">
        <h2>안녕</h2>
        <p>반갑습니다.</p>
      </li>
      <li id="item03" class="col-md-4">
        <h2>안녕</h2>
        <p>반갑습니다.</p>
      </li>
      <li id="item04" class="col-md-4">
        <h2>안녕</h2>
        <p>반갑습니다.</p>
      </li>
    </ul>

    ul.wrap>li#item$$.col-md-4*4>h2{안녕 $$}+p{반갑습니다. $}
    <ul class="wrap">
      <li id="item01" class="col-md-4">
        <h2>안녕 01</h2>
        <p>반갑습니다. 1</p>
      </li>
      <li id="item02" class="col-md-4">
        <h2>안녕 02</h2>
        <p>반갑습니다. 2</p>
      </li>
      <li id="item03" class="col-md-4">
        <h2>안녕 03</h2>
        <p>반갑습니다. 3</p>
      </li>
      <li id="item04" class="col-md-4">
        <h2>안녕 04</h2>
        <p>반갑습니다. 4</p>
      </li>
    </ul>

    lorem2 Lorem, ipsum. lorem3 Lorem, ipsum dolor. lorem Lorem ipsum dolor sit
    amet consectetur adipisicing elit. Animi dicta adipisci nihil sequi,
    provident eum minus illum corrupti fugit! Nulla impedit ducimus laudantium
    molestias, quae itaque velit quas modi aliquam. div>p*3>lorem
    <div>
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Consectetur,
        eligendi. Nihil ducimus perspiciatis eum beatae, eos labore. Delectus
        non eveniet alias, nisi sit velit aliquam consectetur adipisci, unde
        ullam sunt.
      </p>
      <p>
        Rerum, dicta molestias neque nemo facilis quaerat doloremque fugit,
        sapiente sit exercitationem rem! Inventore iste excepturi dolor
        perspiciatis esse natus aliquam nisi culpa ducimus labore, quae vitae
        eveniet nam odit.
      </p>
      <p>
        Nostrum, eius sapiente? Magnam aliquid sunt consectetur aspernatur eos,
        iure nostrum unde earum, debitis reiciendis ab. Quia magnam ab ducimus
        amet eius libero dolores voluptates eum. Explicabo cupiditate placeat
        iure?
      </p>
    </div>

    ul.wrap>li#item$$.col-md-4*4>h2{Caption $$}+p>lorem
    <ul class="wrap">
      <li id="item01" class="col-md-4">
        <h2>Caption 01</h2>
        <p>
          Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nesciunt
          iure doloremque atque aliquam a? Earum tenetur laborum eaque vel,
          perspiciatis enim praesentium dolorem, laudantium minus facilis
          exercitationem voluptas aperiam asperiores.
        </p>
      </li>
      <li id="item02" class="col-md-4">
        <h2>Caption 02</h2>
        <p>
          Qui similique ipsum beatae non iure quod, commodi nihil odit eaque
          fuga animi libero distinctio sunt iusto quaerat suscipit ratione magni
          provident? Nemo dolorum porro aliquam velit delectus molestias beatae?
        </p>
      </li>
      <li id="item03" class="col-md-4">
        <h2>Caption 03</h2>
        <p>
          Quae ipsa illum pariatur ut ullam culpa, unde maiores quisquam
          voluptatem sapiente delectus quam beatae dignissimos consequuntur
          velit explicabo, debitis distinctio nulla atque voluptatum non
          tempora, earum placeat. Fugit, eius.
        </p>
      </li>
      <li id="item04" class="col-md-4">
        <h2>Caption 04</h2>
        <p>
          Aliquid debitis nesciunt aliquam eveniet? Illo, a impedit est aliquid
          eos aliquam aspernatur recusandae at facilis. Quia neque mollitia
          similique, necessitatibus id, ea eveniet, porro rerum ipsa maxime sint
          repudiandae?
        </p>
      </li>
    </ul>

    div[title]
    <div title=""></div>

    input [type="text" placeholder="입력영역"] input
    <div type="text" placeholder="입력영역"></div>

    div>h2+p^h3
    <div>
      <h2></h2>
      <p></p>
    </div>
    <h3></h3>

    footer>div>h2+p^h3
    <footer>
      <div>
        <h2></h2>
        <p></p>
      </div>
      <h3></h3>
    </footer>

    footer>div>h2+p^^h3
    <footer>
      <div>
        <h2></h2>
        <p></p>
      </div>
    </footer>
    <h3></h3>

    div>(header>p)+section>(ul>li*2)
    <div>
      <header>
        <p></p>
      </header>
      <section>
        <ul>
          <li></li>
          <li></li>
        </ul>
      </section>
    </div>

    div>(header>p)+section>(ul>li*2)+footer>(h4>span)
    <div>
      <header>
        <p></p>
      </header>
      <section>
        <ul>
          <li></li>
          <li></li>
        </ul>
        <footer>
          <h4><span></span></h4>
        </footer>
      </section>
    </div>




 html:5				html5 doctype 이 정의됩니다. 

 link:CSS			<link rel="stylesheet" href="style.css"> 


 script:script		<script src=""></script> 

 a:link				<a href="http://"></a> 

 a:mail 			<a href="mailto:"></a> 

 iframe, iframe		<iframe src="" frameborder="0"></iframe> 

 map+ 				<map name=""> 

    				<area shape="" coords="" href="" alt="">

					</map>

 form:get 			<form action="" method="get"></form>

 form:post 			<form action="" method="post"></form> 

 fset 				<fieldset></fieldset> 

 leg 				<legend></legend> 

 input:h 			<input type="hidden" name=""> 

 input:t 			<input type="text" name="" id=""> 

 input:email 		<input type="email" name="" id=""> 

 input:p 			<input type="password" name="" id=""> 

 input:c 			<input type="checkbox" name="" id=""> 

 input:r 			<input type="radio" name="" id=""> 

 input:f 			<input type="file" name="" id=""> 

 input:s 			<input type="submit" value=""> 

 input:i 			<input type="image" src="" alt=""> 

 input:b 			<input type="button" value=""> 

 select+ 			<select name="" id="">

    					<option value=""></option>

					</select>



