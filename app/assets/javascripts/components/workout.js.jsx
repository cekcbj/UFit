

var Workout = React.createClass({
  getInitialState: function() {
    return {
      workout:{
        workout_items: []
      }
    }
  },

  componentDidMount(){
    var component = this;
    $.getJSON("/api/workouts/" + this.props.workout.id).then(function(json){
        component.setState({workout: json.workout});

    })

  },

render: function() {
  var component = this;
  return <div className="inbox">
  {this.state.workout.workout_items.map(function(workout_item){
    return <WorkoutPill key={workout_item.id} workout_item={workout_item}></WorkoutPill>
  })}

   </div>;
}
});





  var WorkoutTimer = React.createClass({
    getInitialState: function() {
      return {secondsElapsed: 0};
    },
    tick: function() {
      this.setState({secondsElapsed: this.state.secondsElapsed + 1});
    },
    componentDidMount: function() {
      this.interval = setInterval(this.tick, 1000);
    },
    componentWillUnmount: function() {
      clearInterval(this.interval);
    },
    render: function() {
      return (
        <div>Seconds Elapsed: {this.state.secondsElapsed}</div>
      );
    }
  });
