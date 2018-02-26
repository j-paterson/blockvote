import React, { Component } from 'react';
import { greeterContract } from './EthereumSetup.js';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props)

    this.state = {
      greeting: ''
    }
  }

  componentWillMount(){
    var data = greeterContract.getGreeting();
    this.setState({
      greeting:data
    })
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <h3>
          {this.state.greeting}
        </h3>
      </div>
    );
  }
}

export default App;
