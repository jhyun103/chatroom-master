<username>
	<h2>This are your messages:</h2>
	<h3 each={user}>{user.author}</h3> <!--Try to figure this out with RIOT-->

	<script>
		var that = this;
		console.log('username.tag');
		this.user = userMsg;
		var userMsg = [];
		console.log(userMsg);

		messagesRef.on('value', function(snap){
			var data = snap.val();
			for(key in data) {
			 userMsg.push(data[key].author);
			}

		});
	</script>

	<style>
		:scope {
			display: block;
			border: 1px solid dodgerblue;
			padding: 0.5em;
		}
		:scope:not(:last-child) {
			margin-bottom: 1em;
		}
	</style>
</username>
