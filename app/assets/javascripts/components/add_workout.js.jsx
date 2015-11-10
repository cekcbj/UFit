
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


  //(1) create callback to handle data
  _updateThisCompoent(newWorkoutItem){
    console.log('in the parent, we can set state everywhr')
    console.log(newWorkoutItem)

    console.log('this isnt good, "workout_item" is different...')
    console.log(this.state.workout.workout_items[0])


    var arrayClone = this.state.workout.workout_items.map(function(wi){
      return wi
    })

    arrayClone.push(newWorkoutItem.workout_item)

    console.log(arrayClone)

    var workoutStateCopy = JSON.parse(JSON.stringify(this.state.workout))
    workoutStateCopy.workout_items = arrayClone

    this.setState({
      workout: workoutStateCopy
    })

    //(2) Pass the callback as a prop to the child-component
       //e.g. <MyComponent  notifyParent={this._updateThisCompoent}/>
  },

  render: function() {
    console.log('current workout: ')
    console.log(this.state.workout)

    //workouts sanity check
    // {this.state.workout ? this.state.workout.name : "no workout..."}
    return(
      <div>
        <hr/>
        <div className="workouts">
          {this.state.workout.workout_items.map(function(workout_item){
            // console.log("workout item in pill??")
            // console.log(workout_item)
            return <WorkoutPill key={workout_item.id} workout_item={workout_item}></WorkoutPill>
          })}
        </div>

        <hr/>

        <WorkoutItemForm workout={this.state.workout} notifyParent={this._updateThisCompoent} ></WorkoutItemForm>

      </div>
  )
  }
});
