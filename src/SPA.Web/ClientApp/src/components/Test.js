import React, { Component } from 'react';

export class Test extends Component {
    static displayName = Test.name;

  constructor(props) {
    super(props);
    this.state = { tests: [], loading: true };
  }

  componentDidMount() {
      this.populateTestData();
  }

  static renderTests(tests) {
      return (
          <table className='table table-striped' aria-labelledby="tabelLabel">
          <thead>
          <tr>
            <th>Title</th>
          </tr>
        </thead>
        <tbody>
          {tests.map(test =>
              <tr key={test.id}>
                  <td>{test.title}</td>
            </tr>
          )}
        </tbody>
      </table>
    );
  }

  render() {
    let contents = this.state.loading
      ? <p><em>Loading...</em></p>
        : Test.renderTests(this.state.tests);

    return (
      <div>
        <h1 id="tabelLabel" >Tests</h1>
        <p>This component demonstrates fetching data from the server.</p>
        {contents}
      </div>
    );
  }

  async populateTestData() {
      const response = await fetch('Test');
    const data = await response.json();
    this.setState({ tests: data, loading: false });
  }
}
