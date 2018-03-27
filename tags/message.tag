<message>

	<span>{ msg.author}</span>
	<span>{ msg.message}</span>
	<span>{ msg.startedAt}</span>
	<span>{ msg.vote}</span>
	<button id="font" type = "vote" onclick={upVote}>Up vote</button>
	<button id="font" type = "vote" onclick={downVote}> Down vote</button>
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
			font-family: 'Share Tech', sans-serif;
			display: block;
			border: 0px solid dodgerblue;
			background-color: pink;
			padding: 0.5em;
		}
		:scope:not(:last-child) {
			margin-bottom: 1em;
		}

			#font{
				font-family: 'Share Tech', sans-serif;
			}
		#happy{
			font-family: 'Share Tech', sans-serif;
			width:25px;
			height: 24px;
		}
	</style>
</message>
