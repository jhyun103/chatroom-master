<message>

	<span>{ msg.author}</span>
	<span>{ msg.message}</span>
	<span>{ msg.startedAt}</span>
	<span>{ msg.vote}</span>
	<button type = "vote" onclick={upVote}>Up vote</button>
	<button type = "vote" onclick={downVote}> Down vote</button>
	<input id= "happy" type="image" src= "images/emoji1.png"  onclick={upVote }></input>
	<input id= "happy" type="image" src= "images/emoji2.png"  onclick={downVote }></input>



	<script>
		var that = this;
		console.log('message.tag');


		upVote(e){

			this.msg.vote ++;
	            console.log(this.msg);
	            database.ref().child("messages/" + this.msg.id + "/vote").set(this.msg.vote);
		}
		downVote(e){


			this.msg.vote--;
			console.log(this.msg);
			database.ref().child("messages/" + this.msg.id + "/vote").set(this.msg.vote);

		}
	//How can we update the vote on the app.tag and the value on database. Look up Firebase update method
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

		#happy{

			width:25px;
			height: 24px;
		}
	</style>
</message>
