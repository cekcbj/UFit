
var AddWorkout = React.createClass({

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



  render: function() {
    console.log('current workout: ')
    console.log(this.state.workout)
    console.log(this.state.workout)

    //workouts sanity check
    // {this.state.workout ? this.state.workout.name : "no workout..."}
    return(
      <div>
        <hr/>
        <div className="workouts">
          {this.state.workout.workout_items.map(function(workout_item){
            console.log("workout item in pill??")
            console.log(workout_item)

            return <WorkoutPill key={workout_item.id} workout_item={workout_item}></WorkoutPill>
          })}
        </div>

        <hr/>

        <WorkoutItemForm workout={this.state.workout}></WorkoutItemForm>

      </div>
  )
  }
});
