<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>스트러츠 게시판2</title>
	<link rel="stylesheet" href="/strutsBoard/board/common/css/css.css" type="text/css">
	
	<!-- 새 창을 띄우는 코드 -->
	<script type="text/javascript">
	function open_win_noresizable(url, name) {
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300, height=150");
	}
	</script>	
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>스트러츠2 게시판</h2></td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>


<!-- 상세보기 관련 테이블 - 번호, 제목, 글쓴이, 내용, 조회수, 등록날짜, 첨부파일 -->
<table width="600" border="0" cellspacing="0" cellpadding="0">


	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#f4f4f4"> 번호</td>
		<td bgcolor="#ffffff">
			&nbsp;&nbsp;<s:property value="resultClass.no"/>
		</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#f4f4f4"> 제목</td>
		<td bgcolor="#ffffff">
			&nbsp;&nbsp;<s:property value="resultClass.subject"/>
		</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#f4f4f4"> 글쓴이</td>
		<td bgcolor="#ffffff">
			&nbsp;&nbsp;<s:property value="resultClass.name"/>
		</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#f4f4f4"> 내용</td>
		<td bgcolor="#ffffff">
			&nbsp;&nbsp;<s:property value="resultClass.content"/>
		</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#f4f4f4"> 조회수</td>
		<td bgcolor="#ffffff">
			&nbsp;&nbsp;<s:property value="resultClass.readhit"/>
		</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#f4f4f4"> 등록날짜</td>
		<td bgcolor="#ffffff">
			&nbsp;&nbsp;<s:property value="resultClass.regdate"/>
		</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#f4f4f4"> 첨부파일</td>
		<td bgcolor="#ffffff">
			&nbsp;&nbsp;
			
			<s:url id="download" action="fileDownloadAction">
				<s:param name="no">
					<s:property value="no"/>
				</s:param>
			</s:url>
			
			<s:a href="%{download}"><s:property value="resultClass.file_orgname" /></s:a>
			
		</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td height="10" colspan="2"></td>
	</tr>

<!-- 버튼목록들 잔뜩	 -->
	<tr>
		<td align="right" colspan="2">
			<s:url id="modifyURL" action="modifyForm">
				<s:param name="no">
					<s:property value="no" />
				</s:param>
			</s:url>
		
			<s:url id="deleteURL" action="deleteForm">
				<s:param name="no">
					<s:property value="no" />
				</s:param>
			</s:url>
			
		<input name="list" type="button" value="수정" class="inputb"
				onclick="javascript:open_win_noresizable('checkForm.action?no=<s:property 
				value="resultClass.no"/>&currentPage=<s:property value="currentPage"/>','modify')">
						
		<input name="list" type="button" value="삭제" class="inputb"
				onclick="javascript:open_win_noresizable('checkForm.action?no=<s:property 
				value="resultClass.no"/>&currentPage=<s:property value="currentPage"/>','delete')">
					
		<input name="list" type="button" value="목록" class="inputb"
				onclick="javascript:location.href='listAction.action?currentPage=<s:property 
				value="currentPage"/>'">
					
		</td>
	</tr>

</table>
</body>
</html>