var WorkoutComplete= React.createClass({
  getInitialState(){
    return {
      workout: this.props.workout
    }
  },



render: function() {
  return (<div className="workoutComplete">
      <h1>CONGRATS UFIT !!!!! </h1>
  <div className="workoutname">
    <strong>name</strong>
    {this.props.workout.name}
  </div>
  <iframe src="//giphy.com/embed/PPcoaMBKaY8vu" width="600" height="650" frameBorder="0" className="giphy-embed" allowFullScreen></iframe><p><a href="http://giphy.com/gifs/transparent-PPcoaMBKaY8vu">via GIPHY</a></p>
  </div>)
}
});
