var WorkoutPill = React.createClass({

  getInitialState(){
    return {
      clickEnabled: false,
      workout_item: this.props.workout_item
    }
  },

  handleViewMessage(){
    var component = this;

    $.post(this.state.workout.began).done(function(json){
      component.setState({workout: json.workout });
    })

    component.setState({clickEnabled: !component.state.clickEnabled});
  },

  render: function() {
    var component = this;

    var workout_item = <div></div>;
    if (component.state.clickEnabled){
      workout_item = <WorkoutItem workout_item={this.state.workout_item}></WorkoutItem>;
    }


    return (
      <div className="workout-item-modal pill-container">
        <h4>{this.state.workout_item.exercise.name}</h4>
        Reps
        <span>{this.state.workout_item.reps}</span><br/>
        Sets
        {this.state.workout_item.sets}
        {workout_item}
      </div>
  )
  }
});
