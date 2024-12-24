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
		<form class="memberinfo-container" method="post" action="${path }/member/updateMemberInfo.do">
			<div class="member-idbox">
				<label class="member-id">아이디</label>
				<div class="member-id" id="id">${memberInfo.memberId }</div>
			</div>
			
			<div class="member-namebox">
				<label class="member-name">이름</label>
				<div class="member-name">${memberInfo.memberName}</div>
			</div>
			
			<div class="member-pwbox">
				<label class="member-pw">비밀번호</label>
				<input type="hidden" name="password">
				<button type="button" class="member-info-btn member-pw-btn">변경</button>
			</div>
			
			<div class="member-emailbox">
				<label class="member-email">이메일</label>
				<div class="member-email">${memberInfo.email }</div>
			</div>
			
			<div class="member-phonebox">
				<label class="member-phone">전화번호</label>
				<input type="hidden" name="phone">
				<div class="member-phone" id="phone">${memberInfo.phone }</div>
				<button type="button" class="member-info-btn member-phone-btn">변경</button>
			</div>
			
			<div class="member-addressbox">
			    <label class="member-address">주소</label>
			    <input type="hidden" name="address">
			    <div class="member-address" id="address">${memberInfo.address != null ? memberInfo.address : ''}</div>
			    <button type="button" class="member-info-btn member-address-btn">변경</button>
			</div>
						
			<div class="member-btdaybox">
				<label class="member-btday">생일</label>
				<div class="member-btday">${memberInfo.birthday }</div>
			</div>
			<button type="submit" class="member-end-btn">회원 정보 수정</button>
		</form>
	</div>
</div>

<script>
//phone 변경 버튼 로직
const phoneChangeButton = document.querySelector('.member-phone-btn');
const memberPhoneBox = document.querySelector('.member-phonebox'); // member-idbox 선택
const memberPhoneValue = document.querySelector('#phone'); // 현재 아이디 표시 영역
let phoneDynamicContainer = null; // 동적 컨테이너 변수

phoneChangeButton.addEventListener('click', () => {
    // 이미 생성된 경우 제거(토글 기능)
    if (phoneDynamicContainer) {
    	phoneDynamicContainer.remove(); // 동적 요소 제거
    	phoneDynamicContainer = null; // 컨테이너 상태 초기화
        phoneChangeButton.style.backgroundColor = "#5c8f51"; // 원래 색상
        phoneChangeButton.style.color = "#fff"; // 원래 글자 색상
        phoneChangeButton.textContent = "변경"; // 버튼 텍스트 복원
        return;
    }

    // div 생성
    phoneDynamicContainer = document.createElement('div');
    phoneDynamicContainer.className = 'change-phonebox change-box';

    // 라벨 생성
    const phoneLabel = document.createElement('label');
    phoneLabel.className = 'change-label';
    phoneLabel.textContent = '새로운 전화번호 :';

    // 인풋 생성
    const phoneInput = document.createElement('input');
    phoneInput.type = 'text';
    phoneInput.className = 'change-input';
    phoneInput.placeholder = '전화번호를 입력하세요';

    // 완료 버튼 생성
    const phoneCompleteButton = document.createElement('button');
    phoneCompleteButton.className = 'complete-btn';
    phoneCompleteButton.textContent = '입력 완료';

    // 완료 버튼 클릭 이벤트
    phoneCompleteButton.addEventListener('click', () => {
        if (!phoneInput.value.trim()) {
            alert('전화번호를 입력하세요.');
            return;
        }
        
     	// 전화번호 형식 검사: 11자리, 010으로 시작해야 함
        if (phoneInput.value.length !== 11 || !phoneInput.value.startsWith('010')) {
            alert('전화번호는 010으로 시작하는 11자리 숫자여야 합니다.');
            return;
        }
        
        memberPhoneValue.textContent = phoneInput.value;
        document.querySelector('input[name="phone"]').value = phoneInput.value;
        

        // 동적 요소 제거
        phoneDynamicContainer.remove();
        phoneDynamicContainer = null;

        // 버튼 상태 복원
        phoneChangeButton.style.backgroundColor = "#5c8f51"; // 원래 색상
        phoneChangeButton.style.color = "#fff"; // 원래 글자 색상
        phoneChangeButton.textContent = "변경"; // 버튼 텍스트 복원
    });

    // div에 요소 추가
    phoneDynamicContainer.appendChild(phoneLabel);
    phoneDynamicContainer.appendChild(phoneInput);
    phoneDynamicContainer.appendChild(phoneCompleteButton);

    // member-idbox 아래에 동적 div 추가
    memberPhoneBox.insertAdjacentElement('afterend', phoneDynamicContainer);

    // 버튼 스타일 변경
    phoneChangeButton.style.backgroundColor = "#fff"; // 하얀 바탕
    phoneChangeButton.style.color = "red"; // 빨간 글씨
    phoneChangeButton.style.border = "1px solid red"; // 빨간 테두리
    phoneChangeButton.textContent = "취소"; // 버튼 텍스트 변경
});


//Pwd 변경 버튼 로직
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
    pwCompleteButton.type = 'button';
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
        document.querySelector('input[name="password"]').value = pwInput1.value;

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


document.addEventListener("DOMContentLoaded", () => {
    const addressChangeButton = document.querySelector('.member-address-btn');
    const memberAddressBox = document.querySelector('.member-addressbox');
    const memberAddressValue = document.querySelector('#address'); // #address 선택
    let addressDynamicContainer = null; // 동적 컨테이너 변수

    addressChangeButton.addEventListener('click', () => {
        // 이미 생성된 경우 제거(토글 기능)
        if (addressDynamicContainer) {
            addressDynamicContainer.remove();
            addressDynamicContainer = null;
            addressChangeButton.style.backgroundColor = "#5c8f51";
            addressChangeButton.style.color = "#fff";
            addressChangeButton.textContent = "변경";
            return;
        }

        // 동적 컨테이너 생성
        addressDynamicContainer = document.createElement('div');
        addressDynamicContainer.className = 'change-addressbox';

        // 시/도 셀렉트 박스
        const sidoSelect = document.createElement('select');
        sidoSelect.name = 'sido';
        sidoSelect.innerHTML = "<option value=''>시/도 선택</option>";

        // 구/군 셀렉트 박스
        const gugunSelect = document.createElement('select');
        gugunSelect.name = 'gugun';
        gugunSelect.innerHTML = "<option value=''>구/군 선택</option>";

        // 완료 버튼 생성
        const addressCompleteButton = document.createElement('button');
        addressCompleteButton.className = 'complete-btn';
        addressCompleteButton.textContent = '입력 완료';

        // 지역 데이터
        const areaData = {
		    "서울특별시": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"],
		    "인천광역시": ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"],
		    "대전광역시": ["대덕구", "동구", "서구", "유성구", "중구"],
		    "광주광역시": ["광산구", "남구", "동구", "북구", "서구"],
		    "대구광역시": ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"],
		    "울산광역시": ["남구", "동구", "북구", "중구", "울주군"],
		    "부산광역시": ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"],
		    "경기도": ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"],
		    "강원도": ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"],
		    "충청북도": ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"],
		    "충청남도": ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군"],
		    "전라북도": ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"],
		    "전라남도": ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"],
		    "경상북도": ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"],
		    "경상남도": ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"],
		    "제주도": ["서귀포시", "제주시", "남제주군", "북제주군"]
		};

        // 시/도 선택박스 초기화
        Object.keys(areaData).forEach((value) => {
            const option = document.createElement('option');
            option.value = value;
            option.textContent = value;
            sidoSelect.appendChild(option);
        });

        // 시/도 변경시 구/군 설정
        sidoSelect.addEventListener('change', function () {
            const selectedSido = this.value;
            gugunSelect.innerHTML = "<option value=''>구/군 선택</option>";

            if (areaData[selectedSido]) {
                areaData[selectedSido].forEach((value) => {
                    const option = document.createElement('option');
                    option.value = value;
                    option.textContent = value;
                    gugunSelect.appendChild(option);
                });
            }
        });

        // 입력 완료 버튼 동작
        addressCompleteButton.addEventListener('click', () => {
            const selectedSido = sidoSelect.value;
            const selectedGugun = gugunSelect.value;

            if (!selectedSido || !selectedGugun) {
                alert('시/도와 구/군을 선택하세요.');
                return;
            }

            // #address 업데이트
            memberAddressValue.textContent = selectedSido +" "+ selectedGugun;
            document.querySelector('input[name="address"]').value = selectedSido +" "+ selectedGugun;

            // 동적 요소 제거
            addressDynamicContainer.remove();
            addressDynamicContainer = null;

            // 버튼 상태 복원
            addressChangeButton.style.backgroundColor = "#5c8f51";
            addressChangeButton.style.color = "#fff";
            addressChangeButton.textContent = "변경";
        });

        // 컨테이너에 요소 추가
        addressDynamicContainer.appendChild(sidoSelect);
        addressDynamicContainer.appendChild(gugunSelect);
        addressDynamicContainer.appendChild(addressCompleteButton);

        // memberAddressBox 아래에 동적 컨테이너 추가
        memberAddressBox.insertAdjacentElement('afterend', addressDynamicContainer);

        // 버튼 스타일 변경
        addressChangeButton.style.backgroundColor = "#fff";
        addressChangeButton.style.color = "red";
        addressChangeButton.style.border = "1px solid red";
        addressChangeButton.textContent = "취소";
    });
});


</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>