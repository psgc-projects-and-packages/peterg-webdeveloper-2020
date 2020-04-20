import React from 'react'

const ProjectList = props => {

  const { projects, deleteProject, editRow } = props

  const guid = 'tmp-guid';
  const slug = 'tmp-slug';
  const ptitle = 'tmp-ptitle';
  const body = 'tmp-body';
  console.log('projects', projects );

  return (
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
        {projects.length > 0 ? (
          projects.map(iter => (
            <tr key={iter.id}>
              <td>{iter.guid}</td>
              <td>{iter.slug}</td>
              <td>{iter.ptitle}</td>
              <td>{iter.body}</td>
              <td>
                <button
                  onClick={() => {
                    editRow(iter)
                  }}
                  className="button muted-button"
                >
                  Edit
                </button>
                <button
                  onClick={() => deleteProject(iter.id)}
                  className="button muted-button"
                >
                  Delete
                </button>
              </td>
            </tr>
          ))
        ) : (
          <tr>
            <td colSpan={3}>No projects</td>
          </tr>
        )}
      </tbody>
    </table>
  )
}

export default ProjectList
