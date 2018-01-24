<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

	//검색
	$(document).ready(function(){
		$("#sBtn, #srchBtn").click(function(){
			$("#sfrm").submit();
		});
	});

	
	$(document).ready(function(){
		$("#moBtn").click(function(){

			var co= $("input:radio[name=co_yn]:checked").val();
			$('#co_yn').val(co);
			var fo= $("input:radio[name=foreign_yn]:checked").val();
			$('#co_yn').val(fo);			
			var ta= $("#tax_yn option:selected").val();
			$('#tax_yn').val(ta);
			var sp= $('#special_relation').is(":checked");
			$('#special_relation').val(sp); 
			var tr= $('#trade_stop').is(":checked");
			$('#trade_stop').val(tr);
			
			console.log("MainPage__수정했다"+$('#trade_stop').val());
			alert("수정한 내용이 저장되었습니다.")
			
			$("#mofrm").submit();
		});
	});
	//수정

	
</script>
<body>
<div style="float;">
	<table width="1300" border="0" align="center">
		<tr>
			<td align="right">
				<input type="button" id="srchBtn" value="조회">
				<input type="button" id="moBtn" value="저장">
				<input type="button" id="delBtn" value="삭제">
			</td>
		</tr>
	</table>
</div>


<%--	검색 상자	--%>
<div style="float: left; width: 25%;">
	<form method="POST" Id="sfrm" action="../Main/SearchProc.lmn" >
	<table width="380" border="1" align="center">
		<tr>
			<th>사업자번호</th>
			<td colspan="2">
				<input type="text" id="bnum" name="bnum" placeholder="사업자번호로 검색">
			</td>
		</tr>
		<tr>
			<th>거래처명</th>
			<td>
				<input type="text" id="cname" name="cname" placeholder="거래처명으로 검색">
				<input type="button" id="sBtn" value="조회">
			</td>
		</tr>
	</table>
	</form><br>
	
		
<%--	검색된 리스트	--%>
	<table width="380" border="1" align="center">
		<tr>
			<th>사업자번호</th>
			<th>거래처명</th>
		</tr>
 		<c:forEach var="data" items="${LIST}"> 
		<tr>
			<td class="box" onclick="location.href='../Main/DetailView.lmn?bnum=${data.bnum}'">${data.bnum}</td>
			<td class="box" onclick="location.href='../Main/DetailView.lmn?bnum=${data.bnum}'">${data.cname}</td>
		</tr>
 		</c:forEach> 
	</table>
</div>


<%--	상세 검색	--%>
<div style="float: right; width: 71%;">
	<form method="POST" Id="mofrm" action="../Main/ModifyProc.lmn" >
	<input type="hidden" name="bnum" value="${MAP.VIEW.bnum}">
	<table width="950" border="1" align="center">
		<tr>
			<th>사업자번호</th>
			<td colspan="2">
				<input type="text" value="${MAP.VIEW.bnum}" readonly />
			</td>
			<th>약칭</th>
			<td colspan="2">
				<input type="text" id="shrt" name="shrt" value="${MAP.VIEW.shrt}" />
			</td>
		</tr>
		<tr>
			<th>거래처명</th>
			<td colspan="4">
				<input type="text" id="cname_d" name="cname" value="${MAP.VIEW.cname}" />
			</td>
		</tr>
		<tr>
			<th>대표자</th>
			<td colspan="2">
				<input type="text" id="ceo" name="ceo" value="${MAP.VIEW.ceo}" />
			</td>
			<th>담당자</th>
			<td colspan="2">
				<input type="text" id="cper" name="charge_person" value="${MAP.VIEW.charge_person}" />
			</td>
		</tr>
		<tr>
			<th>업태</th>
			<td colspan="2">
				<input type="text" id="bcon" name="busi_condition" value="${MAP.VIEW.busi_condition}" />
			</td>
			<th>종목</th>
			<td colspan="2">
				<input type="text" id="item" name="item" value="${MAP.VIEW.item}" />
			</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td colspan="2">
				<input type="text" id="post_num" name="post_num" value="${MAP.VIEW.post_num}" />
				<input type="button" id="zBtn" value="검색">
			</td>
			<th>주소1</th>
			<td colspan="2">
				<input type="text" id="addr1" name="addr1" value="${MAP.VIEW.addr1}" readonly/>
			</td>
		</tr>
		<tr>
			<th>주소2</th>
			<td colspan="4">
				<input type="text" id="addr2" name="addr2" value="${MAP.VIEW.addr2}" />
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td colspan="2">
				<input type="text" id="tel" name="tel" value="${MAP.VIEW.tel}" />
			</td>
			<th>팩스번호</th>
			<td colspan="2">
				<input type="text" id="fax" name="fax" value="${MAP.VIEW.fax}" />
			</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td colspan="4">
				<input type="text" id="homepage" name="homepage" value="${MAP.VIEW.homepage}" />
			</td>
		</tr>
		<tr>
			<th>법인여부</th>
			<td colspan="2" id="co_yn">
				<input type="radio" name="co_yn" value="true" <c:if test="${MAP.VIEW.co_yn eq true}">checked</c:if> />법인
				<input type="radio" name="co_yn" value="false" <c:if test="${MAP.VIEW.co_yn eq false}">checked</c:if> />개인
			</td>
			<th>해외여부</th>
			<td colspan="2" class="foreign_yn">
				<input type="radio" name="foreign_yn" value="true" <c:if test="${MAP.VIEW.foreign_yn eq true}">checked</c:if> />국내
				<input type="radio" name="foreign_yn" value="false" <c:if test="${MAP.VIEW.foreign_yn eq false}">checked</c:if> />해외

			</td>
		</tr>
		<tr>
			<th>과세구분</th>
			<td colspan="2">
				<select id="tax_yn" name="tax_yn" value="${MAP.VIEW.tax_yn}">
					  <option value="Y" <c:if test="${MAP.VIEW.tax_yn eq 'Y'}">selected</c:if>>과세</option>
					  <option value="N" <c:if test="${MAP.VIEW.tax_yn eq 'N'}">selected</c:if>>면세</option>
				</select>
			</td>
			<th>국가</th>
			<td colspan="2">
				<input type="text" name="country_eng" value="${MAP.VIEW.country_eng}" />
				<input type="text" name="country_kor" value="${MAP.VIEW.country_kor}" />
				<input type="button" id="cBtn" value="조회" />
			</td>
		</tr>
		<tr>
			<th>특수관계자</th>
			<td colspan="2">
				<input type="checkbox" id="special_relation" name="special_relation" value="${MAP.VIEW.special_relation}" 
					<c:if test="${MAP.VIEW.special_relation eq true}">checked</c:if>
					<c:if test="${MAP.VIEW.special_relation eq false}"></c:if> />
			</td>
			<th>거래중지</th>
			<td colspan="2">
				<input type="checkbox" id="trade_stop" name="trade_stop" value="${MAP.VIEW.trade_stop}"
					<c:if test="${MAP.VIEW.trade_stop eq true}">checked</c:if>
					<c:if test="${MAP.VIEW.trade_stop eq false}"></c:if> />
			</td>
		</tr>
		<tr>
			<th>계약기간</th>
			<td colspan="4">
				<input type="text" name="contract_period_s" value="${MAP.VIEW.contract_period_s}" /> ~
				<input type="text" name="contract_period_e" value="${MAP.VIEW.contract_period_e}" />
			</td>
		</tr>
		<tr>
			<th>등록정보</th>
			<td colspan="2">
				<input type="text" name="regi_info_man" value="${MAP.VIEW.regi_info_man}" placeholder="이름" />
				<input type="text" name="regi_info_date" value="${MAP.VIEW.regi_info_date}" readonly />
			</td>
			<th>변경정보</th>
			<td colspan="2">
				<input type="text" name="modi_info_man" value="${MAP.VIEW.modi_info_man}" placeholder="이름" />
				<input type="text" name="modi_info_date" value="${MAP.VIEW.modi_info_date}" />
			</td>
		</tr>
	</table>
	<table width="950" border="0" align="center" />
		<tr>
			<td>(거래처 계좌정보)</td>
		</tr>
	</table>
	<table width="950" border="1" align="center">
		<tr>
			<th>사업자번호</th>
			<th>거래처명</th>
			<th>계좌번호</th>
		</tr>
		<tr>
			<td><input type="text" name="factory" value="${MAP.VIEW.factory}" /></td>
			<td><input type="text" name="trade_bank" value="${MAP.VIEW.trade_bank}" /></td>
			<td><input type="text" name="account_num" value="${MAP.VIEW.account_num}" /></td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>


