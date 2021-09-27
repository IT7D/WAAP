<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />




<script>

function downloadCSV() {
    const fileName = "rankView.csv";
    const csv = convertNodeToCsvString();

    var link = document.createElement("a");
    var blob = new Blob(["\uFEFF"+csv], {type: 'text/;charset=utf-8'});
    var url = URL.createObjectURL(blob);
    $(link).attr({"download" : fileName , "href" : url});
    link.click();
}

function convertNodeToCsvString() {
    var result = "";
    var node = $(".div_table_title").children();

    $(node).each(function (index, value) {
       result += $(value).find(".pro_period").text() + ",";
       result += $(value).find(".pro_sub_name").text() + ",";
       result += $(value).find(".pro_aver_cost").text() + ",";
       result += $(value).find(".weather_aver_tem").text() + ",";
       result += $(value).find(".weather_high_tem").text() + ",";
       result += $(value).find(".weather_low_tem").text() + ",";
       result += $(value).find(".weather_precipitation").text() + ",";
       result += $(value).find(".weather_aver_wind").text() + ",";
       result += $(value).find(".weather_high_wind").text() + ",\n";
    })
    
    
    
    var itemNodes = $(".div_table_list").children();
    $(itemNodes).each(function (index, value) {
    	result += $(value).find(".pro_period").text() + ",";
        result += $(value).find(".pro_sub_name").text() + ",";
        result += $(value).find(".pro_aver_cost").text() + ",";
        result += $(value).find(".weather_aver_tem").text() + ",";
        result += $(value).find(".weather_high_tem").text() + ",";
        result += $(value).find(".weather_low_tem").text() + ",";
        result += $(value).find(".weather_precipitation").text() + ",";
        result += $(value).find(".weather_aver_wind").text() + ",";
        result += $(value).find(".weather_high_wind").text() + ",\n";
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
		var com_month = dt.getMonth()+1;
		var com_day = dt.getDate();

		for (var y = com_year-1; y <= com_year; y++) {
			$("#start_day_year").append(
					"<option value='" + y + "'>" + y +  "</option>");
			$("#end_day_year").append(
					"<option value='" + y + "'>" + y + "</option>");
		}

		// 월 뿌려주기(1월부터 12월)

		for(var i = 1; i <= 12; i++){	
			
			$("#start_day_month").append(
					"<option value='" + i + "'>" + i + "</option>")
		}
		
		for(var i = 1; i<= com_month; i++){
			$("#end_day_month").append(
					"<option value='" + i + "'>" + i +  "</option>");
		}
		
		

		// 일 뿌려주기(1일부터 31일)
		for (var i = 1; i <= 31; i++) {
			$("#start_day_day").append(
					"<option value='" + i + "'>" + i +  "</option>");
			$("#end_day_day").append(
					"<option value='" + i + "'>" + i +  "</option>");
		}

		end_year = com_year -1
		
		$("#start_day_year > option[value=" + end_year + "]").attr("selected", "true");
		$("#start_day_month > option[value=" + com_month + "]").attr("selected", "true");
		$("#start_day_day > option[value=" + com_day + "]").attr("selected", "true");
		
		
		
		$("#end_day_year > option[value=" + com_year + "]").attr("selected", "true");
		$("#end_day_month > option[value=" + com_month + "]").attr("selected", "true");
		$("#end_day_day > option[value=" + com_day + "]").attr("selected", "true");

	}
	
</script>



</head>
<body>
	
		<h1>기상 정보 입니다</h1>

	<form action="${contextPath }/waap/priceView.do">

		<select name="pro_div_code" id="pro_div_code">
			<option value="1">식량작물</option>
			<option value="2">채소류</option>
		</select>
		
		
		<select name="pro_area" id="pro_area">
			<option value="서울">서울</option>
			<option value="부산">부산</option>
			<option value="대구">대구</option>	
			<option value="광주">광주</option>
			<option value="대전">대전</option>
		</select>
	
		<select name="start_day_year" id="start_day_year">
			
		</select>
		<select name="start_day_month" id="start_day_month">
			
		</select>
		<select name="start_day_day" id="start_day_day">
		
		</select>
		
		~
			
		
		<select name="end_day_year" id="end_day_year">
			
		</select>
		<select name="end_day_month"  id="end_day_month">
			
		</select>
		<select name="end_day_day"  id="end_day_day">
			
		</select>
		
		<input type="submit">
	
	</form>
	
	<button id="export_button" onclick="downloadCSV()">CSV 다운</button>
	
	${resultMap.start_day } ~ ${resultMap.end_day }
	
	<table border='1' class="div_table">
		
			<thead class="div_table_title">
			
				<tr>
					<th class="pro_period">기간</th>
					<th class="pro_sub_name">품목이름</th>
					<th class="pro_aver_cost">평균가격</th>
					<th class="weather_aver_tem">평균온도</th>
					<th class="weather_high_tem">최고온도</th>
					<th class="weather_low_tem">최저온도</th>
					<th class="weather_precipitation">강수량</th>
					<th class="weather_aver_wind">평균풍속</th>
					<th class="weather_high_wind">최대풍속</th>
				</tr>
			</thead>
			<tbody class="div_table_list">
			
				<c:forEach var="proVO" items="${resultMap.proVOList }">
					<tr>
						
							<td class="pro_period">${proVO.pro_period }</td>
							<td class="pro_sub_name">${proVO.pro_sub_name }</td>
							<td class="pro_aver_cost">${proVO.pro_aver_cost }</td>
					<c:forEach var="weatherVO" items="${resultMap.weatherVOList }">						
						<c:if test="${proVO.pro_period eq weatherVO.weather_period && proVO.pro_area eq weatherVO.weather_area}">
							<td class="weather_aver_tem">${weatherVO.weather_aver_tem }</td>
							<td class="weather_high_tem">${weatherVO.weather_high_tem }</td>
							<td class="weather_low_tem">${weatherVO.weather_low_tem }</td>
							<td class="weather_precipitation">${weatherVO.weather_precipitation }</td>
							<td class="weather_aver_wind">${weatherVO.weather_aver_wind }</td>
							<td class="weather_high_wind">${weatherVO.weather_high_wind }</td>
						</c:if>
					</c:forEach>
						
					</tr>	
				</c:forEach>	
		
				
		
				
		</tbody>
	
	</table>
		
		
		
</body>
