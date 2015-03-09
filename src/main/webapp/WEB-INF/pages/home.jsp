<!DOCTYPE html>
<html>
<head>
<title>Online Payment System</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<style type="text/css">
.bs-example {
	padding-left: 30px;
	padding-right: 30px;
}

label {
	font-weight: normal !important;
}

.payment-row {
	padding: 15px;
	line-height: 25px;
}

.selectStyle {
	color: rgb(53, 68, 100);
	cursor: pointer;
	display: block;
	height: 52px;
}
</style>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.1/themes/smoothness/jquery-ui.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		currencyChange();
	});

	function currencyChange() {
		$.post("/payment/app/getCurrencyRate", {
			sourceCurrency : $("#sourceCurrencySelect option:selected").text()
		}, function(data, status) {
			$("#displayConversionRate").html("Conversion Rate : " + data);
		});
	}
</script>


</head>


<body>
	<%@include file="header.jsp"%>

	<div style="clear: both"></div>
	<div class="container" id="homecontainer" style="padding-top: 100px">
		<div class="row">
			<div class="panel panel-default col-md-8" style="padding: 0px">
				<div class="panel-heading">Your Recent Activities</div>
				<div class="panel-body">

					<div class="payment-row">
						<img src="resources/images/payment_status_completed.png"
							style="padding-right: 50px"></img> <span>Saravanan
							Shanmugavel</span> <span>-</span> <span>100 EUR to INR</span>
					</div>
					<div style="clear: both"></div>
					<div class="payment-row">
						<img src="resources/images/payment_status_cancelled.png"
							style="padding-right: 50px"></img> <span>Saravanan
							Shanmugavel</span> <span>-</span> <span>100 EUR to INR</span>
					</div>
					<div style="clear: both"></div>
					<div class="payment-row">
						<img src="resources/images/payment_status_completed.png"
							style="padding-right: 50px"></img> <span>Saravanan
							Shanmugavel</span> <span>-</span> <span>100 EUR to INR</span>
					</div>

				</div>
				<div class="panel-footer clearfix">
					<div class="pull-right">
						<a href="#" class="btn btn-default">See More</a>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="panel panel-default col-md-3" style="padding: 0px">
				<div class="panel-heading">Transfer Calculator</div>
				<div class="panel-body">
					<label>Source Currency</label> <select id="sourceCurrencySelect"
						name="sourceCurrencyId" class="selectStyle"
						onchange="javascript:currencyChange()"><option value="1">EUR</option>
						<option value="2">GBP</option>
						<option value="3">USD</option>
						<option value="4">PLN</option>
						<option value="5">CHF</option>
						<option value="6">NOK</option>
						<option value="7">SEK</option>
						<option value="8">DKK</option>
						<option value="14">HUF</option>
						<option value="15">GEL</option>
						<option value="30">RON</option>
						<option value="31">TRY</option>
						<option value="40">CZK</option>
						<option value="41">BGN</option></select><br> <label>Destination
						Currency</label><select id="destfCurrencySelect" name="dest	CurrencyId"
						class="selectStyle"><option value="1">INR</option>
					</select><br> <b><span id="displayConversionRate"></span></b>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="panel panel-default col-md-8 " style="padding: 0px">
				<div class="panel-heading">Recent Recipients</div>
				<div class="panel-body">
					<div class="payment-row">
						<span>Saravanan Shanmugavel</span> <span>-</span> <span><a
							href="">Make Payment</a></span>
					</div>
					<div style="clear: both"></div>
					<div class="payment-row">
						<span>Saravanan Shanmugavel</span> <span>-</span> <span><a
							href="">Make Payment</a></span>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

</html>
