import React, { Fragment } from "react"
import PropTypes from "prop-types"
import ProjectList from "./project/ProjectList"
import ProjectEdit from "./project/ProjectEdit"
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom"

class AdminHome extends React.Component {

  deleteProject() {
    console.log('delete project stub')
  }
  editRow() {
    console.log('edit row stub')
  }

  render () {
    return (
      <Fragment>
        Greeting: {this.props.greeting}
        <p>Some text here NOW JSX</p>
        <Router>
          <Switch>
            <Route exact path="/admin/dashboard/project/:slug/edit">
              <ProjectEdit foo="op1"/>
            </Route>
            <Route exact path="/admin/dashboard">
              <ProjectList />
            </Route>
          </Switch>
        </Router>
      </Fragment>
    );
  }
}

AdminHome.propTypes = {
  greeting: PropTypes.string
};
export default AdminHome
