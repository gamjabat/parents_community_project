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
				<div class="member-id" id="id">${memberInfo.memberId }</div>
				<button class="member-info-btn member-id-btn">변경</button>
			</div>
			
			<div class="member-namebox">
				<label class="member-name">이름</label>
				<div class="member-name">${memberInfo.memberName}</div>
			</div>
			
			<div class="member-pwbox">
				<label class="member-pw">비밀번호</label>
				<button class="member-info-btn member-pw-btn">변경</button>
			</div>
			
			<div class="member-emailbox">
				<label class="member-email">이메일</label>
				<div class="member-email">${memberInfo.email }</div>
				<button class="member-info-btn">변경</button>
			</div>
			
			<div class="member-phonebox">
				<label class="member-phone">전화번호</label>
				<div class="member-phone">${memberInfo.phone }</div>
			</div>
			
			<div class="member-addressbox">
				<label class="member-address">주소</label>
				<c:if test="${memberInfo.address != null }">
					<div class="member-address">${memberInfo.address }</div>
				</c:if>
				<button class="member-info-btn">변경</button>
			</div>
			
			<div class="member-btdaybox">
				<label class="member-btday">생일</label>
				<div class="member-btday">${memberInfo.birthday }</div>
			</div>
		</div>
		<button class="member-end-btn">회원 정보 수정</button>
	</div>
</div>

<script>
//ID 변경 버튼 로직
const idChangeButton = document.querySelector('.member-id-btn');
const memberIdBox = document.querySelector('.member-idbox'); // member-idbox 선택
const memberIdValue = document.querySelector('#id'); // 현재 아이디 표시 영역
let idDynamicContainer = null; // 동적 컨테이너 변수

idChangeButton.addEventListener('click', () => {
    // 이미 생성된 경우 제거(토글 기능)
    if (idDynamicContainer) {
        idDynamicContainer.remove(); // 동적 요소 제거
        idDynamicContainer = null; // 컨테이너 상태 초기화
        idChangeButton.style.backgroundColor = "#5c8f51"; // 원래 색상
        idChangeButton.style.color = "#fff"; // 원래 글자 색상
        idChangeButton.textContent = "변경"; // 버튼 텍스트 복원
        return;
    }

    // div 생성
    idDynamicContainer = document.createElement('div');
    idDynamicContainer.className = 'change-idbox change-box';

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
        if (!idInput.value.trim()) {
            alert('아이디를 입력하세요.');
            return;
        }
        // 입력된 값으로 ${memberInfo.memberId } 업데이트
        memberIdValue.textContent = idInput.value;

        // 동적 요소 제거
        idDynamicContainer.remove();
        idDynamicContainer = null;

        // 버튼 상태 복원
        idChangeButton.style.backgroundColor = "#5c8f51"; // 원래 색상
        idChangeButton.style.color = "#fff"; // 원래 글자 색상
        idChangeButton.textContent = "변경"; // 버튼 텍스트 복원
    });

    // div에 요소 추가
    idDynamicContainer.appendChild(idLabel);
    idDynamicContainer.appendChild(idInput);
    idDynamicContainer.appendChild(idCompleteButton);

    // member-idbox 아래에 동적 div 추가
    memberIdBox.insertAdjacentElement('afterend', idDynamicContainer);

    // 버튼 스타일 변경
    idChangeButton.style.backgroundColor = "#fff"; // 하얀 바탕
    idChangeButton.style.color = "red"; // 빨간 글씨
    idChangeButton.style.border = "1px solid red"; // 빨간 테두리
    idChangeButton.textContent = "취소"; // 버튼 텍스트 변경
});

//PW 변경 버튼 로직
const pwChangeButton = document.querySelector('.member-pw-btn');
const memberPwBox = document.querySelector('.member-pwbox'); // member-pwbox 선택
let pwDynamicContainer = null; // 동적 컨테이너 변수

pwChangeButton.addEventListener('click', () => {
    // 이미 생성된 경우 제거(토글 기능)
    if (pwDynamicContainer) {
        pwDynamicContainer.remove(); // 동적 요소 제거
        pwDynamicContainer = null; // 컨테이너 상태 초기화
        pwChangeButton.style.backgroundColor = "#5c8f51"; // 원래 색상
        pwChangeButton.style.color = "#fff"; // 원래 글자 색상
        pwChangeButton.textContent = "변경"; // 버튼 텍스트 복원
        return;
    }

    // div 생성
    pwDynamicContainer = document.createElement('div');
    pwDynamicContainer.className = 'change-pwbox';

    // 첫 번째 라벨과 인풋 생성
    const pwInputContainer1 = document.createElement('div');
    pwInputContainer1.className = 'pw-input-container change-box';
    const pwLabel1 = document.createElement('label');
    pwLabel1.className = 'change-label';
    pwLabel1.textContent = '새로운 비밀번호 :';

    const pwInput1 = document.createElement('input');
    pwInput1.type = 'password';
    pwInput1.className = 'change-input';
    pwInput1.placeholder = '비밀번호 입력';

    // 유효성 검사 메시지
    const pwValidationMessage = document.createElement('div');
    pwValidationMessage.className = 'validation-message error-msg';
    pwValidationMessage.style.color = 'red'; // 초기 상태는 경고 메시지

    // 두 번째 라벨과 인풋 생성
    const pwInputContainer2 = document.createElement('div');
    pwInputContainer2.className = 'pw-input-container change-box';
    const pwLabel2 = document.createElement('label');
    pwLabel2.className = 'change-label';
    pwLabel2.textContent = '새로운 비밀번호 확인 :';

    const pwInput2 = document.createElement('input');
    pwInput2.type = 'password';
    pwInput2.className = 'change-input';
    pwInput2.placeholder = '비밀번호 확인';

    // 비밀번호 일치 메시지
    const pwMatchMessage = document.createElement('div');
    pwMatchMessage.className = 'match-message error-msg';

    // 완료 버튼 생성
    const pwCompleteButton = document.createElement('button');
    pwCompleteButton.className = 'complete-btn';
    pwCompleteButton.textContent = '입력 완료';

    // 유효성 검사 함수
    function validatePassword(password) {
        const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
        return regex.test(password);
    }

    // 비밀번호 입력 실시간 검사
    pwInput1.addEventListener('input', () => {
        if (validatePassword(pwInput1.value)) {
            pwValidationMessage.textContent = '비밀번호가 유효합니다.';
            pwValidationMessage.style.color = 'green';
        } else {
            pwValidationMessage.textContent =
                '비밀번호는 8자리 이상, 대소문자, 숫자, 특수문자(!@#$%^&*)를 각각 포함해야 합니다.';
            pwValidationMessage.style.color = 'red';
        }
    });

    // 비밀번호 일치 실시간 검사
    pwInput2.addEventListener('input', () => {
        if (pwInput1.value === pwInput2.value) {
            pwMatchMessage.textContent = '비밀번호가 일치합니다.';
            pwMatchMessage.style.color = 'green';
        } else {
            pwMatchMessage.textContent = '비밀번호가 일치하지 않습니다.';
            pwMatchMessage.style.color = 'red';
        }
    });

    // 완료 버튼 클릭 이벤트
    pwCompleteButton.addEventListener('click', () => {
        if (!validatePassword(pwInput1.value)) {
            alert('유효한 비밀번호를 입력하세요.');
            return;
        }
        if (pwInput1.value !== pwInput2.value) {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }

     // 기존에 존재하던 #password 요소 제거 (중복 방지)
        const existingPasswordDiv = document.querySelector('.member-pw#password');
        if (existingPasswordDiv) {
            existingPasswordDiv.remove();
        }

        // 비밀번호가 변경되었을 때만 새로운 div 추가
        const passwordDiv = document.createElement('div');
        passwordDiv.className = 'member-pw';
        passwordDiv.id = 'password';
        passwordDiv.textContent = '비밀번호가 성공적으로 변경되었습니다.';

        // pwBox 내부에 추가
        pwChangeButton.insertAdjacentElement('beforebegin', passwordDiv);

        // 동적 요소 제거
        pwDynamicContainer.remove();
        pwDynamicContainer = null;

        // 버튼 상태 복원
        pwChangeButton.style.backgroundColor = "#5c8f51"; // 원래 색상
        pwChangeButton.style.color = "#fff"; // 원래 글자 색상
        pwChangeButton.textContent = "변경"; // 버튼 텍스트 복원
    });

    // div에 요소 추가
    pwInputContainer1.appendChild(pwLabel1);
    pwInputContainer1.appendChild(pwInput1);
    pwDynamicContainer.appendChild(pwInputContainer1);
    pwDynamicContainer.appendChild(pwValidationMessage); // 유효성 검사 메시지 추가 (컨테이너 다음)

    pwInputContainer2.appendChild(pwLabel2);
    pwInputContainer2.appendChild(pwInput2);
    pwInputContainer2.appendChild(pwCompleteButton); // 완료 버튼은 맨 아래
    pwDynamicContainer.appendChild(pwInputContainer2);
    pwDynamicContainer.appendChild(pwMatchMessage); // 비밀번호 일치 메시지 추가 (컨테이너 다음)

    // member-pwbox 아래에 동적 div 추가
    memberPwBox.insertAdjacentElement('afterend', pwDynamicContainer);

    // 버튼 스타일 변경
    pwChangeButton.style.backgroundColor = "#fff"; // 하얀 바탕
    pwChangeButton.style.color = "red"; // 빨간 글씨
    pwChangeButton.style.border = "1px solid red"; // 빨간 테두리
    pwChangeButton.textContent = "취소"; // 버튼 텍스트 변경
});




/* 
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
}); */
</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>