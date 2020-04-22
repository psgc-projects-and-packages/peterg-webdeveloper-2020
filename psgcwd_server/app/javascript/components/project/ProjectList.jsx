import React, { Fragment, Component } from 'react'
import { Link } from "react-router-dom"
import axios from 'axios'

class ProjectList extends Component {

  _isMounted = false;

  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      items: []
    };
  }

  componentDidMount() {
    this._isMounted = true;
    // %TODO: error handling
    //axios.get(`https://jsonplaceholder.typicode.com/todos`)
    axios.get(`/projects.json`)
      .then(res => {
        if (this._isMounted) {
          const items = res.data
          this.setState({ isLoaded: true, items })
          console.log('ProjectList loaded...')
        }
      });
  }

  deleteProject() {
    console.log('delete project stub')
  }
  editRow() {
    console.log('edit row stub')
  }


  componentWillUnmount() {
    this._isMounted = false;
  }

  render () {

    return (
      <Fragment>
        {this.state.isLoaded ? (
          <table>
            <thead>
              <tr>
                <th>GUID</th>
                <th>Slug</th>
                <th>Title</th>
                <th>Contents</th>
              </tr>
            </thead>
            <tbody>
              {this.state.items.length > 0 ? (
                this.state.items.map(iter => (
                  <tr key={iter.id}>
                    <td>{iter.guid}</td>
                    <td>{iter.slug}</td>
                    <td>{iter.ptitle}</td>
                    <td>{iter.body}</td>
                    <td>
                      <Link to={`/admin/dashboard/project/${iter.slug}/edit`}>Edit</Link>
                      <button
                        onClick={() => this.state.deleteProject(iter.id)}
                        className="button muted-button"
                      > Delete</button></td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan={3}>No projects</td>
                </tr>
              )}
            </tbody>
          </table>
        ) : (<p>Loading...</p>)
        }
      </Fragment>
    )
  }

}
export default ProjectList
