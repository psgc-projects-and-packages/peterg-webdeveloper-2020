import React, { Fragment, Component } from 'react'
import axios from 'axios'

class ProjectEdit extends Component {

  constructor(props) {
    super(props);
    this.state = {
      isLoaded: false
    };
  }

  render () {
    return (
      <Fragment>
        Project Edit: {this.props.foo}
      </Fragment>
    )
  }

}
export default ProjectEdit
