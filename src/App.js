import React from 'react';
import './App.css';
import unicorn from './assets/unicorn.jpeg';
import moment from 'moment';

function App() {
  return (   
    <div className="App">
      <header className="App-header">
      <p>hi. When the page loaded, it was {moment().format('hh:mm')}. Here's a unicorn.</p>
      <img alt='unicorn' src={unicorn} />
      </header>
    </div>
  );
}

export default App;
