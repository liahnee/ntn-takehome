<cfscript>
    runEvent("reservations.create")
</cfscript>
<cfoutput>
	<header>
		<div class="title">
			<a href="/main/index"> <h1 class="title-name">National Testing Network<h1></a>
			<p class="title-desc">Your exam has been scheduled!</p>
		</div>
	</header>
    <main id="main-confirmation">
        <div class="confimation-group">
            <p class="label"> Name:</p>
            <p>#prc.reservation.first_name# &nbsp; #prc.reservation.last_name#</p>
        </div>
        <div class="confimation-group">
            <p class="label"> Exam:</p>
            <p>#prc.res.exam#</p>
        </div>
        <div class="confimation-group">
            <p class="label"> Testing Center:</p>
            <p>#prc.res.tc#</p>
        </div>
        <div class="confimation-group">
            <p class="label"> Reservation Receipt:</p>
            <p>#prc.reservation.receipt_number#</p>
        </div>
        <div id="back-to-main">
            <a href="/main/index"><p>Back to main page</p></a>
        </div>
	</main>
</cfoutput>
