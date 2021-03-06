<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form class="form-inline" action="SInfoEnroll" method="get" onsubmit="formCheck(event)">
	<c:set var="sdto" value="${sInfo}"></c:set>
	<c:set var="saddr" value="${sInfo.sAddr}"></c:set>
	
	<style>
		.row1{
			margin-top: 70px;
		}	
	</style>
	<div class="container-fluid sInfo">
		<div class="row row1">
			<div class="col-sm-1"></div>
			<div class="col-sm-4"><h3>상점 기본 정보 수정</h3></div>
		</div>
		<div class="row row2">
			<div class="col-sm-6">
				<div class="panel panel-default Info1">
					<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#info1"><h3 class="panel-title">상점 기본 정보</h3><a></div>
					<div id="info1" class="panel-collapse collapse in">
						<div class="panel-body">
								<div class="form-group">
									<span class="span_Info1">상점명</span>
									&emsp;<input type="text" class="form-control"  name="sName" id="sName" size="28" maxlength="20" value="${sdto.sName}">
								</div>
								<br><br>
								<div class="form-group">
									<span class="span_Info1">상점 전화 </span> 
									&emsp;<input type="text" class="form-control" name="sPhone1" id="sPhone1" size="1" maxlength="4" value="${fn: split(sdto.sPhone,'-')[0]}">-
									<input type="text" class="form-control" name="sPhone2" id="sPhone2" size="1" maxlength="4" value="${fn: split(sdto.sPhone,'-')[1]}">-
									<input type="text" class="form-control" name="sPhone3" id="sPhone3" size="1" maxlength="4" value="${fn: split(sdto.sPhone,'-')[2]}">
								</div>
								<br><br>
								<div class="form-group">
									<span class="span_Info1">상점 주소 </span>&emsp;
									${sdto.sAddr}
								</div>
								<br><br>
								<div class="form-group">
									<span class="span_Info1">지하철역 </span>&emsp;
									${sdto.sSubway}
								</div>
								<br><br>
								<div class="form-group">
									<span class="span_Info1">카테고리 </span>&emsp;
									<c:if test="${sdto.sCategory=='Wine'}">
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
									</c:if>
								</div>
								<br><br>
								<div class="form-group">
									<span class="span_Info1">주차 </span>&emsp;
									<c:if test="${sdto.sParkinglot=='Y'}">
										<input type="radio" name="sParkinglot" id="sParkinglot" value="Y" checked="checked">예
										<input type="radio" name="sParkinglot" id="sParkinglot" value="N">아니오
									</c:if>
									<c:if test="${sdto.sParkinglot=='N'}">
										<input type="radio" name="sParkinglot" id="sParkinglot" value="Y">예
										<input type="radio" name="sParkinglot" id="sParkinglot" value="N" checked="checked">아니오
									</c:if>
								</div>
								<br><br>
								<div class="form-group">
									<span class="span_Info1">테라스 </span>&emsp;
									<c:if test="${sdto.sTerrace=='Y'}">
										<input type="radio" name="sTerrace" id="sTerrace" value="Y" checked="checked">예
										<input type="radio" name="sTerrace" id="sTerrace" value="N">아니오
									</c:if>
									<c:if test="${sdto.sTerrace=='N'}">
										<input type="radio" name="sTerrace" id="sTerrace" value="Y">예
										<input type="radio" name="sTerrace" id="sTerrace" value="N" checked="checked">아니오
									</c:if>
								</div>
								<br><br>
								<div class="form-group">
									<span class="span_Info1">영업시간 </span>(00:00~24:00)<br>
									&emsp;&emsp;&emsp;평일: <input type="text" class="form-control"  name="sWeekday" id="sWeekday" size="20" maxlength="20" placeholder="(예)08:00~23:00" value="${fn: split(sdto.sBusinesshours,'/')[0]}"><br>
									&emsp;&emsp;&emsp;주말: <input type="text" class="form-control"  name="sWeekend" id="sWeekend" size="20" maxlength="20" placeholder="(예)08:00~23:00" value="${fn: split(sdto.sBusinesshours,'/')[1]}"><br>
									&emsp;&emsp;&emsp;휴무: <input type="text" class="form-control"  name="sDayOff" id="sDayOff" size="20" maxlength="20" placeholder="(예)둘째주 월요일 " value="${fn: split(sdto.sBusinesshours,'/')[2]}"><br>
								</div>
								<br><br>
							</div>
						</div>
					</div><!-- collapse -->
				</div><!-- pannel -->
			<div class="col-sm-6">
				<div class="panel panel-default menu">
					<div class="panel-body"><a data-toggle="collapse" data-parent="#accordion" href="#menu"><h3 class="panel-title">메뉴</h3><a></div>
					<div id="menu" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="form-group">
								<span class="span_Info1">메뉴 카테고리1
								<input type="text" class="form-control"  name="sMenuCategory1" id="sMenuCategory1" size="15" maxlength="10" placeholder="(예) 음료, 와인 ">
								</span><hr>
								메뉴1)<br>
								이름: <input type="text" class="form-control"  name="sC1Menu1" id="sC1Menu1" size="40" maxlength="30"><br> 
								설명: <input type="text" class="form-control"  name="sC1Menu1_info" id="sC1Menu1_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
								가격: <input type="text" class="form-control"  name="sC1Price1" id="sC1Price1" size="4" maxlength="6" placeholder="10,000">원 
							</div>
							<br><br>
							<div class="form-group">
								메뉴2)<br>
								이름: <input type="text" class="form-control"  name="sC1Menu2" id="sC1Menu2" size="40" maxlength="30"><br> 
								설명: <input type="text" class="form-control"  name="sC1Menu2_info" id="sC1Menu2_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
								가격: <input type="text" class="form-control"  name="sC1Price2" id="sC1Price2" size="4" maxlength="6" placeholder="10,000">원   
							</div>
							<br><br>
							<div class="form-group">
								메뉴3)<br>
								이름: <input type="text" class="form-control"  name="sC1Menu3" id="sC1Menu3" size="40" maxlength="30"><br> 
								설명: <input type="text" class="form-control"  name="sC1Menu3_info" id="sC1Menu3_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
								가격: <input type="text" class="form-control"  name="sC1Price3" id="sC1Price3" size="4" maxlength="6" placeholder="10,000">원
							</div>
	
							<br><br><br>
							<div class="form-group">
								<span class="span_Info1">메뉴 카테고리2
								<input type="text" class="form-control"  name="sMenuCategory2" id="sMenuCategory2" size="15" maxlength="10" placeholder="(예) 디저트,사이드">
								</span><hr>
								메뉴1)<br>
								이름: <input type="text" class="form-control"  name="sC2Menu1" id="sC2Menu1" size="40" maxlength="30"><br> 
								설명: <input type="text" class="form-control"  name="sC2Menu1_info" id="sC2Menu1_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
								가격: <input type="text" class="form-control"  name="sC2Price1" id="sC2Price1" size="4" maxlength="6" placeholder="10,000">원 
							</div>
							<br><br>
							<div class="form-group">
								메뉴2)<br>
								이름: <input type="text" class="form-control"  name="sC2Menu2" id="sC2Menu2" size="40" maxlength="30"><br>
								설명: <input type="text" class="form-control"  name="sC2Menu2_info" id="sC2Menu2_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
								가격: <input type="text" class="form-control"  name="sC2Price2" id="sC2Price2" size="4" maxlength="6" placeholder="10,000">원
							</div>
							<br><br>
							<div class="form-group">
								메뉴3)<br>
								이름: <input type="text" class="form-control"  name="sC2Menu3" id="sC2Menu3" size="40" maxlength="30"><br>
								설명: <input type="text" class="form-control"  name="sC2Menu3_info" id="sC2Menu3_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
								가격: <input type="text" class="form-control" name="sC2Price3" id="sC2Price3" size="4" maxlength="6" placeholder="10,000">원
							</div>
						</div>
					</div><!-- collapse -->
				</div><!-- pannel -->
			</div>
		</div><!-- end of row -->
		<div class="row row3">
			<div class="col-sm-12">
				<input type="submit" name="submit" class="btn btn-primary btn-cancel btn_submit" value="수정">
				<a href="sManagement"><input type="button" name="cancel" class="btn btn-primary btn-cancel" value="취소"></a>
			</div>
		</div>
	</div>
</form>



