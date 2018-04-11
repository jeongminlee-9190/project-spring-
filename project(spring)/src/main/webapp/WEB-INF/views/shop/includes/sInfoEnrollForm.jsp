<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form class="form-inline" action="SInfoEnroll" method="get" onsubmit="formCheck(event)">
	<c:set var="dto" value="${SoLogin}"></c:set>
	<c:set var="soLicense1" value="${dto.soLicense}"></c:set>
	<c:set var="soLicense" value="${fn:substring(soLicense1,3,10)}"></c:set>
	<input Type="hidden" name="soId" id="soId" value="${dto.soId}">
	<input Type="hidden" name="soLicense" id="soLicense" value="${soLicense}">
	<div class="container-fluid upload">
		<div class="row row1">
			<div class="col-sm-1"></div>
			<div class="col-sm-3"><h3>상점 기본 정보 등록</h3></div>
			 <!-- <span class="red"> *상점은 한 곳만 등록 가능합니다.</span> -->
		</div>
		<div class="row row2">
			<div class="col-sm-1"></div>
			<div class="col-sm-3">
				<table class="table table-hover">
					<tr>
						<th>상점 이름 </th>
						<td><input type="text" class="form-control"  name="sName" id="sName" size="31" maxlength="20"> </td>
					</tr>
					<tr>
						<th>상점 전화 </th>
						<td><input type="text" class="form-control" name="sPhone1" id="sPhone1" size="3" maxlength="4"> -
						<input type="text" class="form-control" name="sPhone2" id="sPhone2" size="3" maxlength="4"> -
						<input type="text" class="form-control" name="sPhone3" id="sPhone3" size="3" maxlength="4"></td>
					</tr>
					<tr>
						<th rowspan="3">상점 주소 </th>
						<td><input type="text" class="form-control"  name="post" id="sample6_postcode" size="5" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
					</tr>
					
					<tr>
						<td><input type="text" class="form-control"  name="sAddr1" id="sample6_address" placeholder="주소" size="31"></td>				
					</tr>
					<tr>
						<td><input type="text" class="form-control"  name="sAddr2" id="sample6_address2" placeholder="(예) 1층 갬성갱단" size="31"></td>
					</tr>
					
				</table>
			</div>
			<div class="col-sm-3">
				<table class="table table-hover">
					<tr>
						<th>지하철역 </th>
						<td><select class="form-control" id="sSubway1" name="sSubway1">
								
							</select>
							
							<select class="form-control" id="sSubway2" name="sSubway2">
							
							</select>
						</td>
					</tr>
					<tr>
						<th>카테고리 </th>
						<td><select class="form-control"  id="sCategory" name="sCategory">
								<option value="c" selected="selected">카페</option>
								<option value="d">디저트</option>
								<option value="w">와인</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>주차</th>
						<td><input type="radio" name="sParkinglot" id="sParkinglot" value="Y" checked="checked">예
						<input type="radio" name="sParkinglot" id="sParkinglot" value="N">아니오</td>
					</tr>
					<tr>
						<th>테라스</th>
						<td><input type="radio" name="sTerrace" id="sTerrace" value="Y" checked="checked">예
						<input type="radio" name="sTerrace" id="sTerrace" value="N">아니오</td>
					</tr>
				</table>
			</div>
			<div class="col-sm-3">
				<table class="table table-hover">
					<tr>
						<th rowspan="3">영업시간<br>(00:00~24:00) </th><!-- 컬럼명: sBusinesshours  -->
						<td>평일: <input type="text" class="form-control"  name="sWeekday" id="sWeekday" size="20" maxlength="20" placeholder="(예)08:00~23:00"></td>	
					</tr>
					<tr>
						<td>주말: <input type="text" class="form-control"  name="sWeekend" id="sWeekend" size="20" maxlength="20" placeholder="(예)08:00~23:00"></td>
					</tr>
					<tr>
						<td>휴무: <input type="text" class="form-control"  name="sDayOff" id="sDayOff" size="20" maxlength="20" placeholder="(예)둘째주 월요일  "></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row row3">
			<div class="col-sm-1"></div>
			<div class="col-sm-3"><span class="menupan">메뉴판</span></div>
		</div>
		<div class="row row4">
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<table class="table table-hover">
					<tr>
						<td colspan="2"><br>메뉴 카테고리1 <input type="text" class="form-control"  name="sMenuCategory1" id="sMenuCategory1" size="15" maxlength="10" placeholder="(예) 음료, 와인 "></td>
					</tr>
					<tr>			
						<td>메뉴1)</td>
						<td> 이름: <input type="text" class="form-control"  name="sC1Menu1" id="sC1Menu1" size="40" maxlength="30"><br> 
						설명: <input type="text" class="form-control"  name="sC1Menu1_info" id="sC1Menu1_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
						가격: <input type="text" class="form-control"  name="sC1Price1" id="sC1Price1" size="4" maxlength="6" placeholder="10,000">원 
						
						</td>	            
					</tr>
					<tr>
						<td>메뉴2)</td>
						<td>이름: <input type="text" class="form-control"  name="sC1Menu2" id="sC1Menu2" size="40" maxlength="30"><br> 
						설명: <input type="text" class="form-control"  name="sC1Menu2_info" id="sC1Menu2_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
						가격: <input type="text" class="form-control"  name="sC1Price2" id="sC1Price2" size="4" maxlength="6" placeholder="10,000">원   
						
						</td>
					</tr>
					<tr>
						<td>메뉴3)</td>
						<td>이름: <input type="text" class="form-control"  name="sC1Menu3" id="sC1Menu3" size="40" maxlength="30"><br> 
						설명: <input type="text" class="form-control"  name="sC1Menu3_info" id="sC1Menu3_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
						가격: <input type="text" class="form-control"  name="sC1Price3" id="sC1Price3" size="4" maxlength="6" placeholder="10,000">원
						
						
						</td>
					</tr>
				</table>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<table class="table table-hover">
					<tr>
						<td colspan="2"><br>메뉴 카테고리2 <input type="text" class="form-control"  name="sMenuCategory2" id="sMenuCategory2" size="15" maxlength="10" placeholder="(예) 디저트,사이드"></td>
					</tr>
					<tr>
						<td>메뉴1)</td>
						<td>이름: <input type="text" class="form-control"  name="sC2Menu1" id="sC2Menu1" size="40" maxlength="30"><br>
						설명: <input type="text" class="form-control"  name="sC2Menu1_info" id="sC2Menu1_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br> 
						 가격: <input type="text" class="form-control"  name="sC2Price1" id="sC2Price1" size="4" maxlength="6" placeholder="10,000">원
						</td>
					</tr>
					<tr>
						<td>메뉴2)</td>
						<td>이름: <input type="text" class="form-control"  name="sC2Menu2" id="sC2Menu2" size="40" maxlength="30"><br>
						설명: <input type="text" class="form-control"  name="sC2Menu2_info" id="sC2Menu2_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
						가격: <input type="text" class="form-control"  name="sC2Price2" id="sC2Price2" size="4" maxlength="6" placeholder="10,000">원
						</td>
					</tr>
					<tr>
						<td>메뉴3)</td>
						<td>이름: <input type="text" class="form-control"  name="sC2Menu3" id="sC2Menu3" size="40" maxlength="30"><br>
						설명: <input type="text" class="form-control"  name="sC2Menu3_info" id="sC2Menu3_info" size="40" maxlength="20" placeholder="20자 내 간단한 설명"><br>
						가격: <input type="text" class="form-control" name="sC2Price3" id="sC2Price3" size="4" maxlength="6" placeholder="10,000">원
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="row row5">
		<div class="col-sm-12">
			<input type="submit" name="submit" class="btn btn-primary btn-cancel btn_submit" value="등록">
			<a href="sManagement"><input type="button" name="cancel" class="btn btn-primary btn-cancel" value="취소"></a>
			<a href="sManagement"><input type="button" name="cancel" class="btn btn-primary btn-cancel" value="score"></a>
		</div>
	</div>	
</form>



