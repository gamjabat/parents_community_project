<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/member/mypageinfoUpdate.css">


<div class="mypage-container">
	<div class="mypage-sidebar">
	    <ul>
	    	<li class="mypage-texttitle">마이 페이지</li>
	    </ul>
	        <ul>
		        <li><a href="${path}/member/mypageinfoupdate.do">나의 정보 수정</a></li>
            	<li><a href="${path}/member/mypageboardlist.do">나의 게시글</a></li>
            	<li><a href="${path}/member/mypagecomment.do">나의 댓글</a></li>
            	<li><a href="${path}/member/mypagelike.do">나의 좋아요</a></li>
	        </ul>
	    </div>
	    <div class="mypageinfo-content">
	   <h2>나의 정보 수정</h2>
		<div class="memberinfo-container">
			<div class="member-idbox">
				<label class="member-id">아이디</label>
				<label class="member-id">유저아이디</label>
				<button class="member-id-btn"><div>변경</div></button>
			</div>
			
			<div class="member-namebox">
				<label class="member-name">이름</label>
				<label class="member-name">유저이름</label>
			</div>
			
			<div class="member-pwbox">
				<label class="member-pw">비밀번호</label>
				<button class="member-pw-btn"><div>변경</div></button>
			</div>
			
			<div class="member-emailbox">
				<label class="member-email">이메일</label>
				<label class="member-email">유저이메일</label>
				<button class="member-email-btn"><div>변경</div></button>
			</div>
			
			<div class="member-phonebox">
				<label class="member-phone">전화번호</label>
				<label class="member-phone">010-5403-2139</label>
			</div>
			
			<div class="member-addressbox">
				<label class="member-address">주소</label>
				<label class="member-address">인천 부평구 덤벼.</label>
				<button class="member-address-btn"><div>변경</div></button>
			</div>
			
			<div class="member-btdaybox">
				<label class="member-btday">생일</label>
				<label class="member-btday">0805</label>
			</div>
		</div>
		<button class="member-end-btn">회원 정보 수정</button>
	</div>
</div>

<script>
// ID 변경 버튼 로직
const idChangeButton = document.querySelector('.member-id-btn');
const memberIdBox = document.querySelector('.member-idbox'); // member-idbox 선택
let idDynamicContainer = null; // 동적 컨테이너 변수

idChangeButton.addEventListener('click', () => {
    // 동적 컨테이너가 이미 존재하면 다시 생성하지 않음
    if (idDynamicContainer) return;

    // div 생성
    idDynamicContainer = document.createElement('div');
    idDynamicContainer.className = 'change-idbox';

    // 라벨 생성
    const idLabel = document.createElement('label');
    idLabel.className = 'change-label';
    idLabel.textContent = '새로운 아이디 :';

    // 인풋 생성
    const idInput = document.createElement('input');
    idInput.type = 'text';
    idInput.className = 'change-input';
    idInput.placeholder = '입력하세요';

    // 완료 버튼 생성
    const idCompleteButton = document.createElement('button');
    idCompleteButton.className = 'complete-btn';
    idCompleteButton.textContent = '입력 완료';

    // 완료 버튼 클릭 이벤트
    idCompleteButton.addEventListener('click', () => {
        alert(`입력된 아이디 값: ${idInput.value}`);
        // 입력 후 동적 요소 제거
        idDynamicContainer.remove();
        idDynamicContainer = null; // 컨테이너 상태 초기화
    });

    // div에 요소 추가
    idDynamicContainer.appendChild(idLabel);
    idDynamicContainer.appendChild(idInput);
    idDynamicContainer.appendChild(idCompleteButton);

    // member-idbox 아래에 동적 div 추가
    memberIdBox.insertAdjacentElement('afterend', idDynamicContainer);
});

// PW 변경 버튼 로직
const pwChangeButton = document.querySelector('.member-pw-btn');
const memberPwBox = document.querySelector('.member-pwbox'); // member-pwbox 선택
let pwDynamicContainer = null; // 동적 컨테이너 변수

pwChangeButton.addEventListener('click', () => {
    if (pwDynamicContainer) return;

    // div 생성
    pwDynamicContainer = document.createElement('div');
    pwDynamicContainer.className = 'change-pwbox';

    // 첫 번째 라벨과 인풋 생성
    const pwLabel1 = document.createElement('label');
    pwLabel1.className = 'change-label';
    pwLabel1.textContent = '새로운 비밀번호 :';

    const pwInput1 = document.createElement('input');
    pwInput1.type = 'password';
    pwInput1.className = 'change-input';
    pwInput1.placeholder = '비밀번호 입력';

    // 두 번째 라벨과 인풋 생성
    const pwLabel2 = document.createElement('label');
    pwLabel2.className = 'change-label';
    pwLabel2.textContent = '새로운 비밀번호 확인 :';

    const pwInput2 = document.createElement('input');
    pwInput2.type = 'password';
    pwInput2.className = 'change-input';
    pwInput2.placeholder = '비밀번호 확인';

    // 완료 버튼 생성
    const pwCompleteButton = document.createElement('button');
    pwCompleteButton.className = 'complete-btn';
    pwCompleteButton.textContent = '입력 완료';

    // 완료 버튼 클릭 이벤트
    pwCompleteButton.addEventListener('click', () => {
        if (pwInput1.value !== pwInput2.value) {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }
        alert(`입력된 비밀번호 값: ${pwInput1.value}`);
        pwDynamicContainer.remove();
        pwDynamicContainer = null;
    });

    // div에 요소 추가
    pwDynamicContainer.appendChild(pwLabel1);
    pwDynamicContainer.appendChild(pwInput1);
    pwDynamicContainer.appendChild(pwLabel2);
    pwDynamicContainer.appendChild(pwInput2);
    pwDynamicContainer.appendChild(pwCompleteButton);

    // member-pwbox 아래에 동적 div 추가
    memberPwBox.insertAdjacentElement('afterend', pwDynamicContainer);
});

// Email 변경 버튼 로직
const emailChangeButton = document.querySelector('.member-email-btn');
const memberEmailBox = document.querySelector('.member-emailbox');
let emailDynamicContainer = null;

emailChangeButton.addEventListener('click', () => {
    if (emailDynamicContainer) return;

    emailDynamicContainer = document.createElement('div');
    emailDynamicContainer.className = 'change-emailbox';

    const emailLabel = document.createElement('label');
    emailLabel.className = 'change-label';
    emailLabel.textContent = '새로운 이메일 :';

    const emailInput = document.createElement('input');
    emailInput.type = 'email';
    emailInput.className = 'change-input';
    emailInput.placeholder = '입력하세요';

    const emailCompleteButton = document.createElement('button');
    emailCompleteButton.className = 'complete-btn';
    emailCompleteButton.textContent = '입력 완료';

    emailCompleteButton.addEventListener('click', () => {
        alert(`입력된 이메일 값: ${emailInput.value}`);
        emailDynamicContainer.remove();
        emailDynamicContainer = null;
    });

    emailDynamicContainer.appendChild(emailLabel);
    emailDynamicContainer.appendChild(emailInput);
    emailDynamicContainer.appendChild(emailCompleteButton);

    memberEmailBox.insertAdjacentElement('afterend', emailDynamicContainer);
});

// Address 변경 버튼 로직
const addressChangeButton = document.querySelector('.member-address-btn');
const memberAddressBox = document.querySelector('.member-addressbox');
let addressDynamicContainer = null;

addressChangeButton.addEventListener('click', () => {
    if (addressDynamicContainer) return;

    addressDynamicContainer = document.createElement('div');
    addressDynamicContainer.className = 'change-addressbox';

    const addressLabel = document.createElement('label');
    addressLabel.className = 'change-label';
    addressLabel.textContent = '새로운 주소 :';

    const addressInput = document.createElement('input');
    addressInput.type = 'text';
    addressInput.className = 'change-input';
    addressInput.placeholder = '입력하세요';

    const addressCompleteButton = document.createElement('button');
    addressCompleteButton.className = 'complete-btn';
    addressCompleteButton.textContent = '입력 완료';

    addressCompleteButton.addEventListener('click', () => {
        alert(`입력된 주소 값: ${addressInput.value}`);
        addressDynamicContainer.remove();
        addressDynamicContainer = null;
    });

    addressDynamicContainer.appendChild(addressLabel);
    addressDynamicContainer.appendChild(addressInput);
    addressDynamicContainer.appendChild(addressCompleteButton);

    memberAddressBox.insertAdjacentElement('afterend', addressDynamicContainer);
});
</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>