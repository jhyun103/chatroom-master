<app>


	<button type="button" name="button" onclick={ showMsg }>Show messages</button>
	<username user = {msg} if={clickedShowMsg}></username>
	<div class="chatLog" ref="chatLog">
		<!-- Messages go here: -->
		<message if={!clickedShowMsg} each={ msg in chatLog }></message>
	</div>
	<label>username:</label>
	 <input type="text" ref="author"/ onkeypress={ sendMsg } >
	<input type="text" ref="messageInput" onkeypress={ sendMsg } placeholder="Enter Message">
	<button type="button" onclick={ sendMsg }>SEND</button>
  <button type ="button" onclick={removeMsg}>Delete ALL</button>
	<script>
		var that = this;
	
		this.clickedShowMsg = false;

		showMsg(e){
			this.clickedShowMsg = true;
		}
		// Global Cached references
		// See index.html for var database, messagesRef

		// Demonstration Data
		this.chatLog = []; // Empty Data

		messagesRef.on('value', function(snapshot){
		  var messagesData = snapshot.val();
			console.log("myData", messagesData);
			// .val() returns to us the raw data object from snapshot

			that.chatLog = [];

			// if we had prior data, clear it so we don't get repeats. You can try removing this line to see what happens.

			// Loop through each obj in messagesData and push each message object into our that.chatLog array
			for (key in messagesData) {
				that.chatLog.push(messagesData[key]);
			}

			that.update();
			// Manually kick-off the tag update after we get any fresh changed data.
		});

		sendMsg(e) {
			if (e.type == "keypress" && e.key !== "Enter") {
				e.preventUpdate = true; // Prevents riot from auto update.
				return false; // Short-circuits function (function exits here, does not continue.)
			}

			var myKey = messagesRef.push().key;
			var msg = {
				author: this.refs.author.value,
				message: this.refs.messageInput.value,
				startedAt: new Date().toLocaleString(),
				vote: 0,
				id: myKey
			};


			//writing code
			messagesRef.child(myKey).set(msg);
			// Notice the difference between messagesRef.push() vs. this.chatLog.push();
			// Here, we are using the Firebase push() to push to the database reference.
			// With that.chatLog.push() we are using the JS Array push() to push directly to the array.
			//messagesRef.child().set(msg);
			/***
				Also notice that we do not that.update() here. All we do is change the state of data on our database.
				Our listener to the database above, is what will react to the changes on our database, then sync our chatLog
				to the data in our database, then kick-off manually that.update() of this riot tag.
			***/

			this.clearInput();
		}

		clearInput(e) {
			this.refs.messageInput.value = "";
			this.refs.messageInput.focus();
		}

		removeMsg(e){

			messagesRef.remove();
		}
	</script>

	<style>
		:scope {
			display: block;
			font-family: Helvetica;
			font-size: 1em;
		}
		.chatLog {
			border: 1px solid grey;
			padding: 1em;
			margin-bottom: 1em;
		}
		[ref="messageInput"], button {
			font-size: 1em;
			padding: 0.5em;
		}
		[ref="messageInput"] {
			width: 50%;
		}
	</style>
</app>
