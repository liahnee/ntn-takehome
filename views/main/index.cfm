<cfscript>
	// examList = runEvent('exams.index');
	// tcList = runEvent('testingcenters.index');

	// function examDate(exam_id){
	// 	rc.selectedExam = exam_id;
	// 	runEvent('examDates.show')
	// }

	// <ul class="radio-group" >
	// 	<cfloop collection=#examList# index="i">
	// 		<label class="radio-label"><input id="exam-option-#examList[i].exam_id#" class="radio-input" name="exam_id" value=#examList[i].exam_id# type="radio" />#examList[i].name#</label>
	//    </cfloop>
	// <ul>
</cfscript>
<cfoutput>
	<header>
		<div class="title">
			<a href="/main/index"> <h1 class="title-name">National Testing Network<h1></a>
			<p class="title-desc">Schedule your exam today!</p>
		</div>
	</header>
	<main id="main-index">
		<cfform id="reservation-form" action="main/confirmation" method="post">
			<div class="form-group"> 
				<p class="label"> Exams </p>
				<p id="exams-loading">Loading...</p>
				<ul id="exams">
				</ul>
			</div>

			<div class="form-group" id="examdates-div"> 
				<p class="label">Exam Dates</p>
				<select id="examdates" name="examdate_id" required >
					<option disabled selected>Select your exam</option>
				</select>
			</div>

			<div class="form-group" id="testingcenters-div"> 
				<p class="label">Testing Centers </p>
				<select id="testingcenters" name="testingcenter_id" required>
					<option disabled selected>Select your exam</option>
				</select>
			</div>

			<div class="form-group"> 
				<label class="label" for="first-name"> First Name </label>
				<input id="first-name" class="form-control" type="text" name="first_name" placeholder="First Name"  required="true" message="Field is required"/>
				<label class="label" for="last-name"> Last Name </label>
				<input id="last-name" class="form-control" type="text" name="last_name" placeholder="Last Name" required /> 
			</div>
			
			<input class="submit-button" type="submit" name="reservation-submit"/>
		</cfform>
	</main>
</cfoutput>