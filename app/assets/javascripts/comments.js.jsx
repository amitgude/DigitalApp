var Comment = React.createClass({

  render: function() {
    return (
      <div>{this.props.comment} <hr/> </div>
    );
  }
});

var Comments = React.createClass({
 render(){
   var createItem = ({ body}) => <Comment comment={body}/>;
   return <div> {this.props.comments.map(createItem)}</div>
 }
});



var CommentsContainer = React.createClass({
  componentWillMount(){
    this.fetchComments();
    setInterval(this.fetchComments,1000);
  },
  fetchComments(){
    $.getJSON(
      this.props.commentsPath,
      (data) => this.setState({ comments: data })
    );
  },

  getInitialState(){
    return { comments: [] };
  },

render(){
  return <Comments comments = {this.state.comments} />;
}

});
