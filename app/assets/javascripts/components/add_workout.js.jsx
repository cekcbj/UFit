


  var AddWorkout = React.createClass({
    getInitialState: function() {
      return{value: "hello"}
    },

    handleChange: function(event) {
      this.setState({value: event.target.value});
    },

    render: function() {
      var value = this.state.value;
       return <input type="integer" value={value}  onChange={this.handleChange}/>;
     }
   });
