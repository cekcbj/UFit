var WorkoutItemForm = React.createClass({

    handleButtonClick(){
      var component = this;
      var name = this.refs.name.value;
      var reps = this.refs.reps.value;
      var sets = this.refs.sets.value;


      var workout_itemJSON = {
        workout_item: {
          reps: reps,
          sets: sets,
          workout_id: this.props.workout.id,
          exercise_attributes: {
            name: name
          }
        }
      };

        console.log('workout id? ', this.props.workout.id);

      // console.log(workout_itemJSON);
      $.post("/api/workout_items/create.json", workout_itemJSON).then(function(serverResponse){
        console.log("response to post is this...")
        console.log(serverResponse)
        component.refs.name.value = "";
        component.refs.reps.value = "";
        component.refs.sets.value = "";

        //(3)
        component.props.notifyParent(serverResponse)
      });
    },

    render: function() {
      return (
        <div className="workout-form pretty-font">
          <div className="input-group">
            <label>Exercise Name</label>
            <select ref="name">
               <option value="Squats">Squats</option>
               <option value="Bench Press">Bench Press</option>
               <option value="Pull-Ups">Pull-Ups</option>
               <option value="Sit-Ups">Sit-Ups</option>
               <option value="Lunges">Lunges</option>
               <option value="Leg Press">Leg Press</option>
               <option value="Dumbell Incline">Dumbell Incline</option>
               <option value="Lateral Raises">Later Raises</option>
              </select>
          </div>
          <div className="input-group">
            <label>Reps</label>
            <input type="text" className="form-control" ref="reps"></input>
          </div>
          <div className="input-group">
            <label>Sets</label>
            <input type="text" className="form-control" ref="sets"></input>
          </div>
          <p className="button-house">
             <button onClick={this.handleButtonClick} className="btn btn-info">+</button>
          </p>
        </div>
      )
    }
  });
