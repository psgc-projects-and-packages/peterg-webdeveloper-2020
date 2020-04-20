import React from "react"
import PropTypes from "prop-types"
import ProjectList from "./project/ProjectList"
import axios from 'axios'

class AdminHome extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      items: []
    };
  }

  componentDidMount() {
    // %TODO: error handling
    //axios.get(`https://jsonplaceholder.typicode.com/todos`)
    axios.get(`/projects.json`)
      .then(res => {
        //const items = res.data.map(obj => obj.data);
        const items = res.data
        this.setState({ isLoaded: true, items })
        console.log('loaded...')
      });
  }

  deleteProject() {
    console.log('delete project stub')
  }
  editRow() {
    console.log('edit row stub')
  }

  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
        <p>Some text here NOW JSX</p>
        { this.state.isLoaded ?
        (<ProjectList 
          projects={this.state.items} 
          deleteProject={ () => deleteProject } 
          editRow={ () => editRow } 
        />)
        : (<p>Loading...</p>)
        }
      </React.Fragment>
    );
  }
}

AdminHome.propTypes = {
  greeting: PropTypes.string
};
export default AdminHome
