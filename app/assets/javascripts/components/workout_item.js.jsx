var WorkoutItem = React.createClass({

  render: function() {
    return (<div className="workoutitem">
    <div className="workoutname">
      <strong>name</strong>
      {this.props.workout_item.name}
    </div>

    <div className="reps">
      {this.props.workout_item.reps}
    </div>

    <div className="sets">
      <span>{this.props.workout_item.sets}</span>
    </div>

    </div>)
  }
});
