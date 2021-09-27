<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html lang="en">

<head>

<script type="text/javascript">
	function downloadCSV() {
		const fileName = "rankView.csv";
		const csv = convertNodeToCsvString();

		var link = document.createElement("a");
		var blob = new Blob([ "\uFEFF" + csv ], {
			type : 'text/;charset=utf-8'
		});
		var url = URL.createObjectURL(blob);
		$(link).attr({
			"download" : fileName,
			"href" : url
		});
		link.click();
	}

	function convertNodeToCsvString() {
		var result = "";
		var node = $(".div_table_title").children();

		$(node).each(function(index, value) {
			result += $(value).find(".row_no").text() + ",";
			result += $(value).find(".row_sub").text() + ",";
			result += $(value).find(".row_updown").text() + ",";
			result += $(value).find(".row_aver_cost").text() + ",\n";
		})

		var itemNodes = $(".div_table_list").children();
		$(itemNodes).each(function(index, value) {
			result += $(value).find(".row_no").text() + ",";
			result += $(value).find(".row_sub").text() + ",";
			result += $(value).find(".row_updown").text() + ",";
			result += $(value).find(".row_aver_cost").text() + "\n";
		})

		return result;
	}
</script>

<script>
	$(document).ready(function() {
		setDateBox();
	});

	// select box 연도 , 월 표시
	function setDateBox() {
		var dt = new Date();
		var com_year = dt.getFullYear();
		var com_month = dt.getMonth() + 1;
		var com_day = dt.getDate();

		for (var y = com_year - 1; y <= com_year; y++) {
			$("#start_day_year").append(
					"<option value='" + y + "'>" + y + "</option>");
			$("#end_day_year").append(
					"<option value='" + y + "'>" + y + "</option>");
		}

		// 월 뿌려주기(1월부터 12월)

		for (var i = 1; i <= 12; i++) {

			$("#start_day_month").append(
					"<option value='" + i + "'>" + i + "</option>")
		}
		
		
		
		if(com_month != 1){
			for (var i = 1; i <= com_month-1; i++) {
				$("#end_day_month").append(
						"<option value='" + i + "'>" + i + "</option>");

			}
		}else{
			for (var i = 1; i <= com_month; i++) {
				$("#end_day_month").append(
						"<option value='" + i + "'>" + i + "</option>");
				$("#end_day_month").append(
						"<option value='" + i + "'>" + i + "</option>");
			}
		}
		
		$("#end_day_month").append(
				"<option value='" + ""  + "'>" + "&nbsp;&nbsp;&nbsp;&nbsp;" + "</option>");
		

		// 일 뿌려주기(1일부터 31일)
		for (var i = 1; i <= 30; i++) {
			$("#start_day_day").append(
					"<option value='" + i + "'>" + i + "</option>");
			$("#end_day_day").append(
					"<option value='" + i + "'>" + i + "</option>");
		}

		end_year = com_year - 1

		$("#start_day_year > option[value=" + end_year + "]").attr("selected",
				"true");
		$("#start_day_month > option[value=" + com_month + "]").attr(
				"selected", "true");
		$("#start_day_day > option[value=" + com_day + "]").attr("selected",
				"true");

		$("#end_day_year > option[value=" + com_year + "]").attr("selected",
				"true");
		$("#end_day_month > option[value=" + (com_month-1) + "]").attr("selected",
				"true");
		$("#end_day_day > option[value=" + com_day + "]").attr("selected",
				"true");

	}
</script>



<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>순위정보</title>


</head>

<body>



	<form action="${contextPath }/waap/rankView.do">
		<div class="container1">
			<div class="btn-group pl-3 pr-3 d-flex justify-content-center"
				role="group" aria-label="price-infor"></div>
			<br>
			<div class="mx-auto" style="width: 800px">
				<h2>순위정보</h2>
				<br>

				<div class="row ">
					<div class="col-2">
						<span class="badge badge-pill badge-primary">부류</span> <br>
						<br> <select name="pro_div_code" id="pro_div_code"
							class="btn btn-warning">
							<option value="1">식량작물</option>
							<option value="2">채소류</option>
						</select>
					</div>

					<div class="col-2">
						<span class="badge badge-pill badge-primary">지역</span> <br>
						<br> <select name="pro_area" id="pro_area"
							class="btn btn-warning">
							<option value="서울">서울</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="광주">광주</option>
							<option value="대전">대전</option>

						</select>

					</div>
					<div class="col-6">
						<span class="badge badge-pill badge-primary">기간</span> <br>
						<br> 시작일 : <select name="start_day_year" id="start_day_year"
							class="btn btn-warning">

						</select> <select name="start_day_month" id="start_day_month"
							class="btn btn-warning">

						</select> <select name="start_day_day" id="start_day_day"
							class="btn btn-warning">

						</select> <br>
						<br> 종료일 : <select name="end_day_year" id="end_day_year"
							class="btn btn-warning">

						</select> <select name="end_day_month" id="end_day_month"
							class="btn btn-warning">

						</select> <select name="end_day_day" id="end_day_day"
							class="btn btn-warning">

						</select>
						
					</div>
					
					
					
					
					<input type="submit" class="btn btn-primary btn-sm" value="조회하기">
					
					
					
				</div>
			</div>
		</div>
	</form>


	<br>
	<br>
	<div class="row">
		<div class="col-6 col-md-1"></div>
		<div class="col-6 col-md-10">

			<div class="container">
				<br>
				<br>
				
				&nbsp;&nbsp;&nbsp;&nbsp;
				<h5>
					비교일 : ${resultMap.start_day } 기준일 : ${resultMap.end_day }
					<button id="export_button" onclick="downloadCSV()"
						class="btn btn-primary">CSV 다운</button>
				</h5>
				<div class="btn-group pl-3 pr-3 d-flex justify-content-center"
					role="group" aria-label="price-infor"></div>
				<div class="container pl-3 pr-3" style="width: 2000px;">
					<div class="table-title">
						<table class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th scope="row">순위</th>
									<th scope="row">품목</th>
									<th scope="row">등락률</th>
									<th scope="row">단위</th>
									<th scope="row">평균가격</th>

								</tr>
							</thead>

							<c:forEach begin="0" end="${fn:length(resultMap.proVOList)-1}"
								var="i">
								<tbody>
									<tr>
										<th scope="row">${i +1 }</th>
										<td>${resultMap.proVOList[i].pro_sub_name }</td>
										<td>${resultMap.proVOList[i].temp_updown }</td>
										<td>${resultMap.proVOList[i].pro_unit}</td>
										<td>${resultMap.proVOList[i].pro_aver_cost}</td>

									</tr>

								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>

			<div class="col-6 col-md-1"></div>
		</div>
	</div>
</body>

</html>