<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" %>
<html>
<head>
 <meta charset="UTF-8">
 <title>File upload</title>
</head>
<body>
 <form id="form1" action="/file/upload" method="post" enctype="multipart/form-data">
  <input  type="file" name="file">
  <input type="text" name="test">
  
 </form>
 
  <form id = "form2" action="upload" method="post" enctype="multipart/form-data" target="hiddenFrame">
  <input type="file" name="file">
 </form>
 
 <iframe name="hiddenFrame" width="0" height="0"></iframe> 
 
 <button id="bu">전송</button>
</body>
  <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
  <script>
  $("#bu").on("click",function(e){
	  e.preventDefault();
	  
	  form1.submit();
  })
  </script>
</html> 
