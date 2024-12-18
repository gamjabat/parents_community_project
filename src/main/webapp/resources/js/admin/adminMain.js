function openPopup(button) {
    // 클릭된 행(row) 가져오기
    const row = button.closest("tr");

    // 사용자 데이터 추출
    const userData = {
        id: row.dataset.id,
        name: row.dataset.name,
        email: row.dataset.email,
        joinDate: row.dataset.joinDate,
        status: row.dataset.status,
        posts: row.dataset.posts,
        comments: row.dataset.comments
    };

    // 팝업 URL에 데이터 전달 (쿼리스트링 사용)
    const popupUrl = `popup.html?id=${userData.id}&name=${userData.name}&email=${userData.email}&joinDate=${userData.joinDate}&status=${userData.status}&posts=${userData.posts}&comments=${userData.comments}`;

    // 팝업 열기
    window.open(popupUrl, "popupWindow", "width=100px,height=400,scrollbars=yes");
}
