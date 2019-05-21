<html>  
  
<head>  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>  
<script>
  
function fun(a)
{
	var xhr = new XMLHttpRequest();
	var num=document.getElementById("UserId").value;

	var group=document.getElementById("group").value;
	
	xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 ) {

            var data = xhr.responseText;
            if(data)
            alert(data);
        }
    }
    xhr.open('GET', 'http://localhost:8080/Example/selectusers?mail='+a+"&num="+num+"&group="+group, true);
    xhr.send(null);	
}
function check(val)
{
	
	var xhr = new XMLHttpRequest();
	var num=document.getElementById("UserId").value;
	
	xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var data = xhr.responseText;
            
            if(data)
            {
            	var r = confirm(data);
            	if(r==true)
            	location.replace("./viewgroup.jsp?group="+val+"&id="+num);
            	else
            		location.reload();
            }
        }
    }
    xhr.open('POST', './checkgroups?group='+val+"&num="+num, true);
    xhr.send(null);	
}
  
$(document).ready(function() {  
    $("#Add").on("click", function() {  
        $("#textboxDiv").append("<div><br><input type='text' name='email' placeholder='Enter mail' onchange='fun(this.value)' required/> <input type='text' name='name' placeholder='Enter name' required/></div>");  
    });  
    $("#Remove").on("click", function() {  
        $("#textboxDiv").children().last().remove();  
    });  
});  

</script>
</head>  
<body> 

<div class="container" style="margin:5%;padding-left:30%">
Hi <%=request.getParameter("name") %>
<form action = "./saveusers" method="post">

<p>Enter Group Name: <input type="text" name="group" id="group" onchange='check(this.value)' required></p>

<div style="margin-top:20px">


<img src="C:/Users/surya-pt2961/Desktop/add.png" id="Add" width="7%" height="10%">

<img src="C:/Users/surya-pt2961/Desktop/minus.png" id="Remove" width="7%" height="10%" style="padding-left:25%">  
    <div id="textboxDiv"></div>  
</div>

<input type="submit" value="add" style="margin-top:20px">
    <input type="hidden" name="UserName" id="UserName" value="<%=request.getParameter("name") %>">
    <input type="hidden" name="UserId" id="UserId" value="<%=request.getParameter("id") %>">

</form>   

</div>

</body>  
  
</html>  