import React, { Fragment, Component } from 'react'
import { Link, withRouter } from "react-router-dom"
import axios from 'axios'

class ProjectEdit extends Component {

  constructor(props) {
    super(props);
    this.state = {
      ptitle: '',
      psubtitle: '',
      obj: {},
      isLoaded: false
    };

    this.handleInputChange = this.handleInputChange.bind(this);
  }

  componentDidMount() {
    axios.get(`/projects/${this.props.match.params.slug}/edit.json`)
      .then(res => {
        const obj = res.data
        this.setState({ isLoaded: true, obj })
        console.log('ProjectEdit loaded...')
      });
  }

  handleInputChange(event) {
    const target = event.target;
    const value = target.name === 'isGoing' ? target.checked : target.value;
    const name = target.name;
    this.setState({
      [name]: value
    });
  }

  render () {
    return (
      <Fragment>
        Project Edit: {this.props.foo}
        {this.state.isLoaded ? (
          <form>
            <label>
              Title:
              <input
                name="ptitle" type="text"
                checked={this.state.ptitle}
                onChange={this.handleInputChange} />
            </label>
            <br />
            <label>
              Sub-Title:
              <input
                name="psubtitle" type="text"
                checked={this.state.psubtitle}
                onChange={this.handleInputChange} />
            </label>
          </form>
        ) : (<p>Loading...</p>)
        }
      </Fragment>
    )
  }

}

export default withRouter(ProjectEdit)
