
<script
	src="resources/js/common-functions.js"></script>

<div>
	<nav class="navbar navbar-default navbar-fixed-top"
		style="padding: 10px">
		<div class="navbar-header">
			<img src="" />
		</div>

		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav nav-pills pull-right">
				<li class="dropdown" id="paymentmenu"><a href="#"
					data-toggle="dropdown" class="dropdown-toggle">Payment<b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="javascript:initiateTransfer()">Transfer</a></li>
						<li><a href="#">View All</a></li>
					</ul></li>
				<li class="dropdown" id="accountmenu"><a href="#"
					data-toggle="dropdown" class="dropdown-toggle">Account<b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Profile</a></li>
						<li><a href="#">Logout</a></li>
					</ul></li>
				<li id="signupmenu"><a href="#">Signup</a></li>
				<li id="loginmenu"><a href="javascript:loginClick()">Login</a></li>
				<li id="logutmenu"><a href="#">Logout</a></li>
			</ul>
		</div>
	</nav>
</div>