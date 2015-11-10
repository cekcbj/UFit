var InWorkout = React.createClass({

  getInitialState(){
    return {
      workout: {
        name: "...loading...",
        id: this.props.workout.id,
        workout_items: []
      }
    }
  },

  _fetchworkouts(){
    var component = this;

    $.getJSON("/api/workouts/" + this.state.workout.id + ".json")
      .then(function(json){
        console.log('AJAX request result--->')
        console.log(json)
        component.setState({workout: json.workout});
      })

  },

  componentDidMount(){
    this._fetchworkouts();
    // this.workoutInterval = setInterval(this.fetchworkouts, 10000);
  },

  componentWillUnmount(){
    // clearInterval(this.workoutInterval);
  },


  //(1) create callback to handle data
  _updateThisCompoent(newInfo){
  },

   handleButtonClick: function(data) {
     var component = this
     console.log("button clicked");
     return $.ajax({
        url: '/api/workout_items/update.json',
        type: 'PATCH',
        data: {jsonData: JSON.stringify(data)},
        dataType: "json"
      }).then(function(response){

        console.log('workout item response')
        console.log(response)

        var arrayClone = component.state.workout.workout_items.map(function(wk_itm){
          if (wk_itm.id === response.workout_item.id){
            console.log('workout item iterator')
            console.log(wk_itm)
            wk_itm.completed = true
          }

          return wk_itm


        })

        var workoutStateCopy = JSON.parse(JSON.stringify(component.state.workout))
        workoutStateCopy.workout_items = arrayClone


       component.setState({
         workout: workoutStateCopy
       })
    });


   },



  render: function() {
    var component = this
    console.log('current workout: ')
    console.log(this.state.workout)

    //workouts sanity check
    // {this.state.workout ? this.state.workout.name : "no workout..."}
    return(
      <div className="workouts">
        <hr/>
        console.log(this.state.workout.workout_items)
          {this.state.workout.workout_items.map(function(workout_item){
            console.log("workout item in pill??")
            console.log(workout_item)
            var statusMsg = "wrong"
            var statusColor = "tomato"

            if (workout_item.completed) {
              statusColor =  "lightgreen"
              statusMsg = "Complete"
            };


            return(
              <div>
                <h4 style={ {background: statusColor} }>{statusMsg}</h4>
                <WorkoutPill key={workout_item.id}  workout_item={workout_item}></WorkoutPill>
                <button onClick={ component.handleButtonClick.bind(component, workout_item) } className="btn btn-default">√ Finished!</button>
                <p><br/><br/></p>
              </div>
              )
           })
          }
      </div>
     )
  }
});
