var InWorkout = React.createClass({
  getInitialState(){
    return {
      workout: {
        name: "...loading...",
        id: this.props.workout.id,
        began:this.props.workout.began,
        completed:this.props.workout.completed,
        workout_items: []
      }
    }
  },

  _fetchworkouts(){
    var component = this;
    $.getJSON("/api/workouts/" + this.state.workout.id + ".json")
      .then(function(json){

        component.setState({
          workout: json.workout
        });
      })

  },

  componentDidMount(){
    this._fetchworkouts();
     this.workoutInterval = setInterval(this._fetchworkouts, 5000);
  },

  componentWillUnmount(){
     clearInterval(this.workoutInterval);
  },


  //(1) create callback to handle data

  handleStartWorkoutClick: function(){
    var component = this;
    console.log(component)

    $.post("/api/dashboard/"+ this.state.workout.id +"/began")
    .done(function(json){
      component.setState({
        workout: json.workout
    })

    component.setState({began: !component.state.began});
  })

},

  //   $.ajax({
  //      url: '/api/workout/update.json',
  //      type: 'PATCH',
  //      data: {jsonData: JSON.stringify(data)},
  //      dataType: "json"
  //       })
  //
  //      });
  //   // var workoutStateCopy = JSON.parse(JSON.stringify(this.state.workout))
  //   //
  //   // workoutStateCopy.began ? workoutStateCopy.began = false : workoutStateCopy.began = true
  //   // console.log(workoutStateCopy)
  //
  //
  // },

  handleSingleItemClick: function(data) {
     var component = this
     console.log("button clicked");

     $.ajax({
        url: '/api/workout_items/update.json',
        type: 'PATCH',
        data: {jsonData: JSON.stringify(data)},
        dataType: "json"
      }).then(function(response){

        console.log('workout item response (check for .complete)')
        console.log(response,component.state)

        //1 find index workout_item that was updated on workout.workout_items & replace on new array
        var updatedWorkoutItemsList = component.state.workout.workout_items.map(function(wk_itm){
          if (wk_itm.id === response.workout_item.id)
            return response.workout_item
          //   console.log(wk_itm.id, " ----- ", response.workout_item.id )
          //   console.log(response.workout_item)
          //   console.log(wk_itm.id)
          // }
          return wk_itm
          // console.log(wk_itm)
        })
        var workoutCopy = JSON.parse(JSON.stringify(component.state.workout))

        workoutCopy.workout_items = updatedWorkoutItemsList
        console.log(workoutCopy);
        var isDone = !workoutCopy.workout_items.find(workout=>{return !workout.completed})
        // console.log('-----------------',!isDone,isDone)

         if(isDone)
           React.render(<WorkoutComplete workout={component.state.workout}/>,document.getElementById('root'));
         else
          component.setState({
            workout: workoutCopy,
          })
      });


   },

  _renderPills: function(w_itms){
     var component = this
     var pills = w_itms.map(function(workout_item){

      var statusMsg = "NOT Complete"
      var statusColor = "#c0392b"

      if (workout_item.completed ) {
        statusColor =  "#16a085"
        statusMsg = "Complete"
      };

      return (
         <div className = "pillholder" style={ {background: statusColor} }>
           <WorkoutPill key={workout_item.id}  workout_item={workout_item}></WorkoutPill>
           <p className="button-house">
             <button onClick={ component.handleSingleItemClick.bind(component, workout_item) } className="pulse btn btn-default ">√ Finished!
             </button>
          </p>
         </div>
       )
      })

     return pills
   },

  _renderOverlay: function(began){
    var overlayVisible
    began === true ? overlayVisible = false : overlayVisible = true

    console.log('workout began?? ', this.state.workout.began)
    console.log('overlay visible ??? ', overlayVisible)

    return (
      <div className= "overlay" style={{
          position: 'absolute',
          zIndex: 10,
          background: "rgba(215,215,215,.75)",
          top: 0 , left: 0, height: '100%', width: '100%',
          display: overlayVisible ? "block" : "none"
        }}>
      </div>
    )
  },

  render: function() {
    var component = this
    var workoutBegan = this.state.workout.began;

    //workouts sanity check
    // {this.state.workout ? this.state.workout.name : "no workout..."}
    return(
      <div className="workouts" >

        <button className="btn btn-primary btn-lg btn-block"
                disabled={workoutBegan ? "disabled" : ""}
                onClick={this.handleStartWorkoutClick}>
                Start Workout
        </button>
        <hr/>

        <div className="pills text-center" style={{position: 'relative'}} >
          {this._renderPills(this.state.workout.workout_items)}
          {this._renderOverlay(component.state.workout.began)}
        </div>
      </div>
     )
  }
});
