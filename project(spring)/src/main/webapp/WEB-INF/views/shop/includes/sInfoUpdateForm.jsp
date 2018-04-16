<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<style>
h3,h4{
	text-align: left;
}
.sInfoupdateText{
	font-size: 22px;
}
a{
	text-decoration: none;
}
.btngroup{
	text-align: right;
}
.row1{
	margin-top: 70px;
	text-align: right;
}	
.row2{
	margin-left: 5%;
	margin-right: 5%;
}
.row3{
	margin-left: 6%;
	margin-right: 6%;	
}
.row4{
	text-align: center;
	margin-bottom: 70px;	
}
.panel{
	border: 1px solid orange;
}
.panel-body{
	color: black;
}
.panel-title{
    font-weight: bold;
    color: orange;
}
.span_Info1{
   	font-size: 16px;
    font-weight: bold;
}
.btn-cancel{
	border: 1px solid orange;
	background-color: white;
	width: 100px;
	color: orange;
}
.btn-submit{
	border: 1px solid orange;
	background-color: orange;
	width: 100px;
	color: white;
}
</style>
<form class="form-inline" action="sInfoUpdate" method="post">
	<c:set var="sdto" value="${sInfo}"></c:set>
	<input Type="hidden" name="sCode" id="sCode" value="${sdto.sCode}">
	<div class="container-fluid sbasicInfo">
		<div class="row row1">
			<div class="col-sm-1"></div>
			<div class="col-sm-3"><span class="sInfoupdateText">상점  기본 정보 수정</span></div>
			<div class="col-sm-6 btngroup">
			<input type="submit" class="btn btn-primary btn-submit" value="수정">
			<input type="reset" class="btn btn-primary btn-cancel" value="취소"></div>
		</div>
	</div>
	<br>
	<div class="container-fluid sInfo">
		<div class="row row2">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="panel panel-default Info1">
					<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#info1"><h3 class="panel-title">상점 기본 정보</h3><a></div>
					<div id="info1" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="col-sm-6">
								<div class="form-group">
									<span class="span_Info1">상점명</span> 
									<input type="text" class="form-control"  name="sName" id="sName" size="31" maxlength="20" value="${sdto.sName}">
								</div>
								<br><br>
								<span class="span_Info1">주소 </span>${sdto.sAddr}<br>
								<span class="span_Info1">지하철역 </span>${sdto.sSubway}<br><br>
								<div class="form-group">
									<span class="span_Info1">전화 </span>
									<input type="text" class="form-control" name="sPhone1" value="${fn: split(sdto.sPhone,'-')[0]}" size="3" maxlength="4"> - 
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="sPhone2" value="${fn: split(sdto.sPhone,'-')[1]}" size="3" maxlength="4"> - 
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="sPhone3" value="${fn: split(sdto.sPhone,'-')[2]}" size="3" maxlength="4">
								</div>
								<br><br>
								<div class="form-group">
									<span class="span_Info1">카테고리</span> ${sdto.sCategory}
									<%-- <c:if test="${sdto.sCategory=='Wine'}">
										<select class="form-control"  id="sCategory" name="sCategory">
											<option value="c">카페</option>
											<option value="d">디저트</option>
											<option value="w" selected="selected">와인</option>
										</select>
									</c:if>
									<c:if test="${sdto.sCategory=='Cafe'}">
										<select class="form-control"  id="sCategory" name="sCategory">
											<option value="c" selected="selected">카페</option>
											<option value="d">디저트</option>
											<option value="w">와인</option>
										</select>
									</c:if>
									<c:if test="${sdto.sCategory=='Dessert'}">
										<select class="form-control"  id="sCategory" name="sCategory">
											<option value="c">카페</option>
											<option value="d" selected="selected">디저트</option>
											<option value="w">와인</option>
										</select>
									</c:if> --%>
								</div>
								
							</div>
							<div class="col-sm-6">
				
								<div class="form-group">
									<span class="span_Info1">영업시간 </span>
								</div>
								<br>
								<div class="form-group">
									평일)  <input type="text" class="form-control" name="sWeekday" value="${fn: split(sdto.sBusinesshours,'/')[0]}">
								</div>
								<br>
								<div class="form-group">
									주말)  <input type="text" class="form-control" name="sWeekend" value="${fn: split(sdto.sBusinesshours,'/')[1]}">
								</div>
								<br>
								<div class="form-group">
									휴무)  <input type="text" class="form-control" name="sDayOff" value="${fn: split(sdto.sBusinesshours,'/')[2]}">
								</div>
								<br><br>
								<span class="span_Info1">테라스 </span>
								<c:if test="${sdto.sTerrace=='Y'}">
									<input type="radio" name="sTerrace" id="sTerrace" value="Y" checked="checked">예
									<input type="radio" name="sTerrace" id="sTerrace" value="N">아니오
								</c:if>
								<c:if test="${sdto.sTerrace=='N'}">
									<input type="radio" name="sTerrace" id="sTerrace" value="Y">예
									<input type="radio" name="sTerrace" id="sTerrace" value="N" checked="checked">아니오
								</c:if>
								<br><br>
								<span class="span_Info1">주차 </span>
								<c:if test="${sdto.sParkinglot=='Y'}">
									<input type="radio" name="sParkinglot" id="sParkinglot" value="Y" checked="checked">예
									<input type="radio" name="sParkinglot" id="sParkinglot" value="N">아니오
								</c:if>
								<c:if test="${sdto.sParkinglot=='N'}">
									<input type="radio" name="sParkinglot" id="sParkinglot" value="Y">예
									<input type="radio" name="sParkinglot" id="sParkinglot" value="N" checked="checked">아니오
								</c:if>
							</div>
						</div>
					</div><!-- collapse -->
				</div><!-- pannel -->
			</div>
			<div class="col-sm-1"></div>
		</div><!-- end of row -->
	</div>
	<div class="row row3">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="panel panel-default menu">
				<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#menu"><h3 class="panel-title">메뉴</h3><a></div>
				<div id="menu" class="panel-collapse collapse in">
					<div class="panel-body">
							<c:set var="sMenuCategory1" value="${fn: split(sdto.sMenu1,'/')[0]}"></c:set>
							<c:set var="sC1Menu1" value="${fn: split(sdto.sMenu1,'/')[1]}"></c:set>
							<c:set var="sC1Menu2" value="${fn: split(sdto.sMenu1,'/')[2]}"></c:set>
							<c:set var="sC1Menu3" value="${fn: split(sdto.sMenu1,'/')[3]}"></c:set>
							<c:set var="sMenuCategory2" value="${fn: split(sdto.sMenu2,'/')[0]}"></c:set>
							<c:set var="sC2Menu1" value="${fn: split(sdto.sMenu2,'/')[1]}"></c:set>
							<c:set var="sC2Menu2" value="${fn: split(sdto.sMenu2,'/')[2]}"></c:set>
							<c:set var="sC2Menu3" value="${fn: split(sdto.sMenu2,'/')[3]}"></c:set>
							<div class="col-sm-6">
								<h4><input type="text" class="form-control"  name="sMenuCategory1" id="sMenuCategory1" size="15" maxlength="10" value="${sMenuCategory1}"></h4>
								<div class="form-group">
									<input type="text" class="form-control"  name="sC1Menu1" id="sC1Menu1" size="13" maxlength="30" value="${fn: split(sC1Menu1,':')[0]}"> 
									<input type="text" class="form-control"  name="sC1Menu1_info" id="sC1Menu1_info" size="20" maxlength="30" value="${fn: split(sC1Menu1,':')[1]}">
									<input type="text" class="form-control"  name="sC1Price1" id="sC1Price1" size="2" maxlength="6" value="${fn: split(sC1Menu1,':')[2]}">원 
								</div>
								<div class="form-group">
									<input type="text" class="form-control"  name="sC1Menu2" id="sC1Menu2" size="13" maxlength="30" value="${fn: split(sC1Menu2,':')[0]}"> 
									<input type="text" class="form-control"  name="sC1Menu2_info" id="sC1Menu2_info" size="20" maxlength="30" value="${fn: split(sC1Menu2,':')[1]}">
									<input type="text" class="form-control"  name="sC1Price2" id="sC1Price2" size="2" maxlength="6" value="${fn: split(sC1Menu2,':')[2]}">원 
								</div>
								<div class="form-group">
									<input type="text" class="form-control"  name="sC1Menu3" id="sC1Menu3" size="13" maxlength="30" value="${fn: split(sC1Menu3,':')[0]}"> 
									<input type="text" class="form-control"  name="sC1Menu3_info" id="sC1Menu3_info" size="20" maxlength="30" value="${fn: split(sC1Menu3,':')[1]}">
									<input type="text" class="form-control"  name="sC1Price3" id="sC1Price3" size="2" maxlength="6" value="${fn: split(sC1Menu3,':')[2]}">원 
								</div>
							</div>
							<div class="col-sm-6">
								<h4><input type="text" class="form-control"  name="sMenuCategory2" id="sMenuCategory2" size="15" maxlength="10" value="${sMenuCategory2}"></h4>
								<div class="form-group">
									<input type="text" class="form-control"  name="sC2Menu1" id="sC2Menu1" size="13" maxlength="30" value="${fn: split(sC2Menu1,':')[0]}"> 
									<input type="text" class="form-control"  name="sC2Menu1_info" id="sC2Menu1_info" size="20" maxlength="30" value="${fn: split(sC2Menu1,':')[1]}">
									<input type="text" class="form-control"  name="sC2Price1" id="sC2Price1" size="2" maxlength="6" value="${fn: split(sC2Menu1,':')[2]}">원 
								</div>
								<div class="form-group">
									<input type="text" class="form-control"  name="sC2Menu2" id="sC2Menu2" size="13" maxlength="30" value="${fn: split(sC2Menu2,':')[0]}"> 
									<input type="text" class="form-control"  name="sC2Menu2_info" id="sC2Menu2_info" size="20" maxlength="30" value="${fn: split(sC2Menu2,':')[1]}">
									<input type="text" class="form-control"  name="sC2Price2" id="sC2Price2" size="2" maxlength="6" value="${fn: split(sC2Menu2,':')[2]}">원 
								</div>
								<div class="form-group">
									<input type="text" class="form-control"  name="sC2Menu3" id="sC2Menu3" size="13" maxlength="30" value="${fn: split(sC2Menu3,':')[0]}"> 
									<input type="text" class="form-control"  name="sC2Menu3_info" id="sC2Menu3_info" size="20" maxlength="30" value="${fn: split(sC2Menu3,':')[1]}">
									<input type="text" class="form-control"  name="sC2Price3" id="sC2Price3" size="2" maxlength="6" value="${fn: split(sC2Menu3,':')[2]}">원 
								</div>
							</div>
					</div>
				</div><!-- collapse -->
			</div><!-- pannel -->
		</div>
		<div class="col-sm-1"></div>
	</div>
	<!-- <div class="row row4">
		<div class="col-sm-12">
			<input type="submit" class="btn btn-primary btn-submit" value="수정">
			<input type="reset" class="btn btn-primary btn-cancel" value="취소">
		</div>
	</div> -->
</form>