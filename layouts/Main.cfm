<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Catherine Yang's NTN take-home</title>
	<meta name="description" content="National Testing Network take-home project">
    <meta name="author" content="Catherine Yang">
	<!---Base URL --->
	<base href="#event.getHTMLBaseURL()#" />


	<!---css --->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="/views/main/main.css">
	<script src='/views/main/index.js'></script>

</head>
<body>
	<nav></nav>
	<div class="container">#renderView()#</div>

</body>
</html>
</cfoutput>
