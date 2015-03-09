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
<script src="resources/js/common-functions.js"></script>

<script>
	$(document).ready(function() {
		$("#addressDialog").hide();
	});

	function currencyChange() {
		$.post("/payment/app/getCurrencyRate", {
			sourceCurrency : $("#sourceCurrencySelect option:selected").text()
		}, function(data, status) {
			$("#displayConversionRate").html("Conversion Rate : " + data);
			var amount = $("#amount").val();
			$("#recipientRate").html(amount * data);
		});
	}

	function loadFromAddressBook() {
		$("#addressDialog").show();
		$("#addressDialog").dialog({
			width : 'auto',
			maxWidth : 300,
			height : 'auto',
			fluid : true
		});
	}
	
	function selectAccount(){
		alert("Select Account... ");
	}
</script>
<body>
	<%@include file="header.jsp"%>

	<div style="padding-top: 80px"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form role="form">
					<div class="form-group">
						<label for="name">Recipient Name <a
							href="javascript:loadFromAddressBook()"><b>(Load From
									Address Book)</b></a></label> <input type="text" class="form-control"
							id="recipientName" placeholder="Enter Name">
					</div>
					<div class="form-group">
						<label id="LABEL_16" for="bankSelect"> Recipient Bank
							Details </label> <select class="form-control" id="bankSelect">

							<option selected="selected" value="0" id="OPTION_28">
								Please select</option>
							<option value="336" id="OPTION_33">ANDHRA BANK</option>
							<option value="337" id="OPTION_37">AXIS BANK LTD</option>
							<option value="355" id="OPTION_54">CITI BANK</option>
							<option value="357" id="OPTION_56">CITY UNION BANK LTD</option>
							<option value="358" id="OPTION_58">CORPORATION BANK</option>
							<option value="368" id="OPTION_70">HDFC BANK LTD</option>
							<option value="414" id="OPTION_71">HSBC</option>
							<option value="369" id="OPTION_72">ICICI BANK LTD</option>
							<option value="370" id="OPTION_73">IDBI BANK LTD</option>
							<option value="371" id="OPTION_74">INDIAN BANK</option>
							<option value="372" id="OPTION_75">INDIAN OVERSEAS BANK</option>
							<option value="697" id="OPTION_76">INDUSIND BANK LTD</option>
							<option value="374" id="OPTION_77">ING VYSYA BANK LTD</option>

							<option value="398" id="OPTION_116">STATE BANK OF INDIA</option>

						</select>
					</div>
					<div class="form-group">
						<label for="name">IFSC Code</label> <input type="text"
							class="form-control" id="ifscCode">
					</div>
					<div class="form-group">
						<label for="name">Account Number</label> <input type="text"
							class="form-control" id="accountNumber">
					</div>
					<div class="form-group">
						<label for="name">IFSC Code</label> <input type="text"
							class="form-control" id="ifscCode">
					</div>
					<div class="form-group">
						<label for="name">First Name</label> <input type="text"
							class="form-control" id="firstName">
					</div>
					<div class="form-group">
						<label for="name">Last Name</label> <input type="text"
							class="form-control" id="lastName">
					</div>
					<!-- <div class="form-group">
					<label for="name">Address Line1</label> <input type="text"
						class="form-control" id="addressLine1" >
				</div>
				<div class="form-group">
					<label for="name">Address Line2</label> <input type="text"
						class="form-control" id="addressLine2" >
				</div>
				<div class="form-group">
					<label for="city">City</label> <input type="text"
						class="form-control" id="city">
				</div>
				<div class="form-group">
					<label for="state">State</label> <input type="text"
						class="form-control" id="state">
				</div> -->
					<div class="form-group">
						<label for="phoneNumber">Phone Number</label> <input type="text"
							class="form-control" id="phoneNumber">
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="text" id="email"
							class="form-control" />
					</div>
				</form>
			</div>

			<div class="col-md-1"></div>
			<div class="panel panel-default col-md-3 pull-right"
				style="padding: 0px">
				<div class="panel-heading">Transfer Calculator</div>
				<div class="panel-body">
					<label>Enter Amount : </label> <input type="text" id="amount"></input><br>
					<label>Source Currency</label> <select id="sourceCurrencySelect"
						name="sourceCurrencyId" class="selectStyle"
						onchange="javascript:currencyChange()">
						<option value="0">Please Select</option>
						<option value="1">EUR</option>
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
						<option value="41">BGN</option>
					</select><br> <label>Destination Currency</label><select
						id="destfCurrencySelect" name="dest	CurrencyId"
						class="selectStyle"><option value="1">INR</option>
					</select><br> <b><span id="displayConversionRate"></span></b> <b><label>Receipient
							Will Get : </label> <span id="recipientRate"></span></b><br>
					<button type="button" class="btn btn-primary">Make Payment</button>
				</div>
			</div>
		</div>
	</div>


	<div id="addressDialog">
		<div class="form-group" style="border-bottom:2px solid">
		<a href="javascript:selectAccount()" >
			<label style="min-width: 100px">Name : </label> <span>Saravanan
				Shanmugavel</span> <br>
			<label style="min-width: 100px">Bank : </label> <span>ICICI Bank</span>	<br>
			<label style="min-width: 100px">Account Number : </label> <span>0001919837</span>	<br>
			<label style="min-width: 100px">Last Transaction : </label> <span>22-03-2015</span> <br>
			</a>
		</div>
		<div class="form-group">
		<a href="javascript:selectAccount()" >
			<label style="min-width: 100px">Name : </label> <span>Saravanan
				Shanmugavel</span> <br>
			<label style="min-width: 100px">Bank : </label> <span>ICICI Bank</span>	<br>
			<label style="min-width: 100px">Account Number : </label> <span>0001919837</span>	<br>
			<label style="min-width: 100px">Last Transaction : </label> <span>22-03-2015</span> <br>
			</a>
		</div>
	</div>

</body>

</head>
</html>
