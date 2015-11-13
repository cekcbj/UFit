var ViewAddWorkout = React.createClass({

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



  //(1) create callback to handle data
  // _updateThiscomponent(newWorkoutItem){
  //
  //   var arrayClone = this.state.workout.workout_items.map(function(wi){
  //     return wi
  //   })
  //
  //   arrayClone.push(newWorkoutItem.workout_item)
  //
  //
  //   var workoutStateCopy = JSON.parse(JSON.stringify(this.state.workout))
  //   workoutStateCopy.workout_items = arrayClone
  //
  //   this.setState({
  //     workout: workoutStateCopy
  //   })
  //
  //   //(2) Pass the callback as a prop to the child-component
  //      //e.g. <MyComponent  notifyParent={this._updateThiscomponent}/>
  // },

  componentDidMount(){
    // this._fetchworkouts();
     this.workoutInterval = setInterval(this._fetchworkouts, 5000);
  },

  componentWillUnmount(){
     clearInterval(this.workoutInterval);
  },

  render: function() {
    console.log('current workout: ')
    console.log(this.state.workout)

    //workouts sanity check
    // {this.state.workout ? this.state.workout.name : "no workout..."}
    return(
      <div>
        <div className="col-sm-10">
        {this.state.workout.workout_items.map(function(workout_item){

          return <WorkoutPill key={workout_item.id} workout_item={workout_item}></WorkoutPill>
        })}
        </div>

      </div>
  )
  }
});
