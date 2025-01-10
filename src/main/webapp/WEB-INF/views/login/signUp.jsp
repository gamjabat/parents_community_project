<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/common/main.css">
<link rel="stylesheet" href="${path}/resources/css/login/signUp.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>

<section id="main-container" class="d-flex flex-column align-items-center">
<div class="container d-flex flex-column align-items-center justify-content-center">
        <div class="signup-container">
    <div class="signup-title">회원가입</div>
    <form id="signup-form" method="post" action="${path}/login/signupend.do">
      <div class="form-group">
        <div class="input-label">
        	<label for="name">이름</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group">
        	<input type="text" id="name" name="name" placeholder="이름 입력">
        </div>
      </div>

      <div class="form-group">
      	<div class="input-label">
        	<label for="id">아이디</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group d-flex flex-column ">
        	<div class="input-group id-group d-flex flex-row w-100" style="gap: 10px;">
        		<input type="text" id="id" name="id" placeholder="아이디 입력" class="form-control">
        		<button type="button" id="check-id-btn" class="btn btn-secondary" onclick="checkId();">중복 확인</button>
        	</div>
        	<small class="error"></small>
        </div>
      </div>
      
      <div class="form-group">
        <div class="input-label">
        	<label for="nickname">닉네임</label>
        </div>
        <div class="input-group">
        	<input type="text" id="nickname" name="nickname" placeholder="닉네임 입력 (선택 사항)">
        </div>
      </div>
      
      <div class="form-group">
      	<div class="input-label">
        	<label for="password">비밀번호</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group d-flex flex-column">
        	<input type="password" id="password" name="password" placeholder="비밀번호 입력">
        	<small class="error"></small>
        </div>
      </div>

      <div class="form-group">
      	<div class="input-label">
        	<label for="confirm-password">비밀번호 확인</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group d-flex flex-column">
        	<input type="password" id="confirm-password" placeholder="비밀번호 확인 입력">
        	<small class="error"></small>
        </div>
      </div>

      <div class="form-group">
      	<div class="input-label">
        	<label for="email">이메일</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group">
          <input type="email" id="email" name="email" placeholder="이메일 입력">
        </div>
      </div>
      
      <div class="form-group">
        <div class="input-label">
            <label for="birth">생년월일</label>
            <span style="color: red;">*</span>
        </div>
        <div class="input-group my-2" style="display: flex; gap: 10px;">
            <select id="birth-year" name="birth-year" class="form-select">
                <option value="">년도</option>
            </select>
            <select id="birth-month" name="birth-month" class="form-select">
                <option value="">월</option>
            </select>
            <select id="birth-day" name="birth-day" class="form-select">
                <option value="">일</option>
            </select>
        </div>
      </div>

      <div class="form-group">
      	<div class="input-label">
        	<label for="phone">전화번호</label>
        	<span style="color: red;">*</span>
        </div>
        <div class="input-group d-flex flex-column">
        	<input type="text" id="phone" name="phone" placeholder="휴대폰 번호 입력 (예: 01012345678)">
        	<small class="error"></small>
        </div>
      </div>

      <div class="form-group">
        <div class="input-label">
            <label for="address">주소</label>
        </div>
        <div class="input-group my-2" style="display: flex; gap: 10px;">
            <select name="sido" class="form-select">
                <option>시/도 선택</option>
            </select>
            <select name="gugun" class="form-select">
                <option>구/군 선택</option>
            </select>
        </div>
      </div>

      <button type="submit" class="signup-btn my-3">회원 가입</button>
    </form>
  </div>
</section>

<script>
	$(document).ready(function () {
	    // 생년월일 초기화
	    const currentYear = new Date().getFullYear();
	    const $birthYear = $('#birth-year');
	    const $birthMonth = $('#birth-month');
	    const $birthDay = $('#birth-day');
	
	    // 년도 추가 (1900년부터 현재년도까지)
	    for (let year = currentYear; year >= 1900; year--) {
	        $birthYear.append('<option value="' + year + '">' + year + '년</option>');
	    }
	
	    // 월 추가 (1월부터 12월)
	    for (let month = 1; month <= 12; month++) {
	        $birthMonth.append('<option value="' + month + '">' + month + '월</option>');
	    }
	
	    // 일 추가 (월 선택에 따라 동적으로 변경)
	    $birthMonth.change(function () {
	        const selectedYear = parseInt($birthYear.val(), 10);
	        const selectedMonth = parseInt($birthMonth.val(), 10);
	
	        if (isNaN(selectedYear) || isNaN(selectedMonth)) {
	            $birthDay.empty().append('<option value="">일</option>');
	            return;
	        }
	
	        const daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();
	        $birthDay.empty().append('<option value="">일</option>');
	
	        for (let day = 1; day <= daysInMonth; day++) {
	            $birthDay.append('<option value="' + day + '">' + day + '일</option>');
	        }
	    });
	

	
	const checkId = () => {
	    const idInput = document.getElementById("id");
	    const idError = document.querySelector('.id-group').nextElementSibling;
	    const idValue = idInput.value.trim();
	
	    if (!idValue) {
	        idError.textContent = "아이디를 입력해주세요.";
	        idError.style.color = "red";
	        return;
	    }
	
	    $.ajax({
	        url: `${path}/member/idduplicate.do`,
	        type: "POST",
	        data: { id: idValue },
	        success: function (response) {
	            if (response.isDuplicate) {
	                idError.textContent = "이미 사용 중인 아이디입니다.";
	                idError.style.color = "red";
	            } else {
	                idError.textContent = "사용 가능한 아이디입니다.";
	                idError.style.color = "green";
	            }
	        },
	        error: function () {
	            idError.textContent = "아이디 확인 중 문제가 발생했습니다.";
	            idError.style.color = "red";
	        }
	    });
	};
	
	//실시간 유효성 검사
	const idInput = document.getElementById('id');
	const passwordInput = document.getElementById('password');
	const confirmPasswordInput = document.getElementById('confirm-password');
	const phoneInput = document.getElementById('phone');
	const idError = document.querySelector('.id-group').nextElementSibling;
	const passwordError = passwordInput.nextElementSibling;
	const confirmPasswordError = confirmPasswordInput.nextElementSibling;
	const phoneError = phoneInput.nextElementSibling;
	
	// 유효성 검사 함수
	function validateId() {
	  const idValue = idInput.value.trim();
	  const idRegex = /^[a-zA-Z][a-zA-Z0-9]{5,12}$/; // 영문 또는 영문+숫자 조합, 6~13자
	  if (!idRegex.test(idValue)) {
	    idError.textContent = '아이디는 영문 또는 영문+숫자 조합으로 6~13자여야 합니다.';
	    idError.style.color = 'red';
	    return false;
	  }
	  idError.textContent = '';
	  return true;
	}

	function validatePassword() {
		  const passwordValue = passwordInput.value.trim();
		  const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/; // 최소 8자, 특수문자, 대소문자, 숫자 포함
		  if (!passwordRegex.test(passwordValue)) {
		    passwordError.textContent = '비밀번호는 8자리 이상, 대소문자, 숫자, 특수문자(!@#$%^&*)를 각각 포함해야 합니다.';
		    passwordError.style.color = 'red';
		    return false;
		  }
		  passwordError.textContent = '';
		  return true;
		}

	function validateConfirmPassword() {
		  if (passwordInput.value.trim() !== confirmPasswordInput.value.trim()) {
		    confirmPasswordError.textContent = '비밀번호가 일치하지 않습니다.';
		    confirmPasswordError.style.color = 'red';
		    return false;
		  }
		  confirmPasswordError.textContent = '비밀번호가 일치합니다.';
		  confirmPasswordError.style.color = 'green';
		  return true;
		}

	function validatePhone() {
		  const phoneValue = phoneInput.value.trim();
		  const phoneRegex = /^010\d{8}$/; // 010으로 시작하고 11자리 숫자
		  if (!phoneRegex.test(phoneValue)) {
			phoneError.textContent = '전화번호는 010으로 시작하며 숫자 11자리여야 합니다.';
			confirmPasswordError.style.color = 'red';
		    return false;
		  }
		  phoneError.textContent = '';
		  return true;
		}

	idInput.addEventListener('input', validateId);
	passwordInput.addEventListener('input', validatePassword);
	confirmPasswordInput.addEventListener('input', validateConfirmPassword);
	phoneInput.addEventListener('input', validatePhone);


	document.getElementById("signup-form").addEventListener("submit", async function (event) {
	    event.preventDefault(); // 기본 동작 방지
	
	    const isValid = await fn_invalidate(); // 유효성 검사 결과
	    if (isValid) {
	        this.submit(); // 유효성 검사 통과 시 제출
	    } else {
	        console.log("유효성 검사 실패, 제출 중단");
	    }
	});

	const fn_invalidate = async () => {
	    const nameInput = document.getElementById('name');
	    const idInput = document.getElementById('id');
	    const passwordInput = document.getElementById('password');
	    const confirmPasswordInput = document.getElementById('confirm-password');
	    const emailInput = document.getElementById('email');
	    const birthYearSelect = document.getElementById('birth-year');
	    const birthMonthSelect = document.getElementById('birth-month');
	    const birthDaySelect = document.getElementById('birth-day');
	    const phoneInput = document.getElementById('phone');
	
	    if (nameInput.value.trim() === "") {
	        alert("이름을 입력해주세요.");
	        nameInput.focus();
	        return false;
	    }
	
	    if (idInput.value.trim() === "") {
	        alert("아이디를 입력해주세요.");
	        idInput.focus();
	        return false;
	    }
	
	    if (passwordInput.value.trim() === "") {
	        alert("비밀번호를 입력해주세요.");
	        passwordInput.focus();
	        return false;
	    }
	
	    if (confirmPasswordInput.value.trim() !== passwordInput.value.trim()) {
	        alert("비밀번호가 일치하지 않습니다.");
	        confirmPasswordInput.focus();
	        return false;
	    }
	
	    if (emailInput.value.trim() === "") {
	        alert("이메일을 입력해주세요.");
	        emailInput.focus();
	        return false;
	    }
	
	    if (!birthYearSelect.value || !birthMonthSelect.value || !birthDaySelect.value) {
	        alert("생년월일을 모두 선택해주세요.");
	        return false;
	    }
	
	    const isDuplicateValid = await checkDuplicate();
	    return isDuplicateValid;
	};

	const checkDuplicate = () => {
	    const nicknameInput = document.getElementById("nickname");
	    const nicknameValue = nicknameInput.value.trim();
	    const phoneInput = document.getElementById("phone");
	    const phoneValue = phoneInput.value.trim();
	    const emailInput = document.getElementById("email");
	    const emailValue = emailInput.value.trim();
	
	    return new Promise((resolve) => {
	        $.ajax({
	            url: `${path}/member/checkduplicate.do`,
	            type: "POST",
	            data: { nickname: nicknameValue, phone: phoneValue, email: emailValue },
	            success: function (response) {
	                if (response.nicknameIsDuplicate) {
	                    alert("입력하신 닉네임이 이미 존재합니다.");
	                    nicknameInput.focus();
	                    resolve(false);
	                } else if (response.phoneIsDuplicate) {
	                    alert("입력하신 전화번호가 이미 존재합니다.");
	                    phoneInput.focus();
	                    resolve(false);
	                } else if (response.emailIsDuplicate) {
	                    alert("입력하신 이메일이 이미 존재합니다.");
	                    emailInput.focus();
	                    resolve(false);
	                } else {
	                    resolve(true);
	                }
	            },
	            error: function () {
	                alert("중복 확인 중 오류가 발생했습니다.");
	                resolve(false);
	            }
	        });
	    });
	};
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 