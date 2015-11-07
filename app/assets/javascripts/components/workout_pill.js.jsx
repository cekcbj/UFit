var WorkoutPill = React.createClass({

  getInitialState(){
    return {
      clickEnabled: false,
      workout_item: this.props.workout_item
    }
  },

  render: function() {
    var component = this;

    var workout_item = <div></div>;
    if (component.state.clickEnabled){
      workout_item = <WorkoutItem workout_item={this.state.workout_item}></WorkoutItem>;
    }


    return (
      <div className="workout-item-modal">
      <i className='ficon ficon-checkmark mark-done' onClick={this.props.onClickDone}></i>
      <span>{this.props.value}</span>
      <i className='close' onClick={this.props.onClickClose}>&times;</i>
      <h4>{this.state.workout_item.exercise.name}</h4>
      Reps
      <span>{this.state.workout_item.reps}</span>
      Sets
      <td>{this.state.workout_item.sets}</td>
      {workout_item}
      </div>
  )
  }
});
